module ApplicationHelper
  def sklonenie(number, krokodil, krokodila, krokodilov)
    if number == nil || !number.is_a?(Numeric)
      number = 0
    end

    ostatok = number % 100

    if ostatok >= 11 && ostatok <= 14
      return krokodilov
    end

    ostatok = number % 10

    if ostatok == 1
      return krokodil
    end
    if ostatok >= 2 && ostatok <= 4
      return krokodila
    end
    if (ostatok >= 5 && ostatok <= 9) || ostatok == 0
      return krokodilov
    end
  end
end
