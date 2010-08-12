module UsersHelper
  def add_whitespace(nr)
    if nr.length >= 3
      counter = 4
      stop = false
      while stop == false
        nr = nr.insert(-counter, ' ')
        if nr.index(' ') <= 3
          stop = true
        end
        counter += 4
      end
    end
    return nr
  end
end
