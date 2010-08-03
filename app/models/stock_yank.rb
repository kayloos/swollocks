# == Schema Information
# Schema version: 20100726014541
#
# Table name: stock_yanks
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  low        :string(255)
#  high       :string(255)
#  latest     :string(255)
#  turnover   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class StockYank < ActiveRecord::Base
  def yank_data
    require 'iconv'
    require 'open-uri'
    require 'hpricot'

    f = open("https://www.nordnet.dk/mux/web/marknaden/kurslista/aktier.html?marknad=Danmark&lista=1_1&large=on&mid=on&sektor=0&subtyp=price&sortera=aktie&sorteringsordning=stigande")
    f.rewind
    Hpricot(Iconv.conv('utf-8', f.charset, f.readlines.join("\n")))
  end

  def sort_data_and_save
    if StockYank.exists?
      if Rails.env == "development"
        StockYank.delete_all
        ActiveRecord::Base.connection.execute "delete from sqlite_sequence where name = 'stock_yanks'"
      else
        ActiveRecord::Base.connection.execute "TRUNCATE TABLE stock_yanks RESTART IDENTITY"
      end
    end
    workstring = (yank_data/"tbody").to_html
    stock_array = Array.new
    for i in (0..74)
      name_pos = workstring.index("underline")
      workstring = workstring.slice(name_pos+11..-1)
      end_of_a_tag = workstring.index("</a>")
      name = workstring.slice(0..end_of_a_tag-1)
      workstring = workstring.slice(end_of_a_tag+15..-1)
      stock_array[i] = Array.new
      stock_array[i] << name
      for e in (0..7)
        start_td_tag = workstring.index("<td>")
        end_td_tag = workstring.index("</td>")
        stock_array[i] << workstring.slice(start_td_tag+4..end_td_tag-1).gsub(' ', '').gsub(',','.').to_f unless e == 1 or e == 2 or e == 3 or e == 4
        workstring = workstring.slice(end_td_tag+3..-1)
      end
      save = StockYank.create(:name => stock_array[i][0],
                              :latest => stock_array[i][1],
                              :high => stock_array[i][2],
                              :low => stock_array[i][3],
                              :turnover => stock_array[i][4]
                             )
    end
  end
end
