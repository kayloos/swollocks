module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Ruby on Rails Tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{h(@title)}"
    end
  end

# this adds proper whitespace to numbers (which is beforehand converted to strings)
  def add_whitespace(string_nr)
    string_nr = string_nr.to_s
    if string_nr.length >= 3
      counter = 4
      stop = false
      while stop == false
        string_nr = string_nr.insert(-counter, ' ')
        if string_nr.index(' ') <= 3
          stop = true
        end
        counter += 4
      end
    end
    string_nr
  end
end
