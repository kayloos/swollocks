class StockYank < ActiveRecord::Base
require 'ruby-debug'
  def yank_data
    require 'iconv'
    require 'open-uri'
    require 'hpricot'

    f = open("https://www.nordnet.dk/mux/web/marknaden/kurslista/aktier.html?marknad=Danmark&lista=1_1&large=on&mid=on&sektor=0&subtyp=price&sortera=aktie&sorteringsordning=stigande")
    f.rewind
    Hpricot(Iconv.conv('utf-8', f.charset, f.readlines.join("\n")))
  end

  def sort_data
    workstring = (yank_data/"tbody").to_html
    pos = workstring.index("underline")
    workstring = workstring.slice(pos+11..pos+10+400)
    end_of_a_tag = workstring.index("</a>")

    name = workstring.slice(0..end_of_a_tag-1)
    workstring = workstring.slice(end_of_a_tag+15..workstring.length)
    test = Array.new
    for i in (0..7)
      start_td_tag = workstring.index("<td>")
      end_td_tag = workstring.index("</td>")
      test << workstring.slice(start_td_tag+4..end_td_tag-1) unless i == 1 or i == 2
      workstring = workstring.slice(end_td_tag+3..workstring.length)
    end

    return test
  end
end
