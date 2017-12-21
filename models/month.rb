class Month
  def self.all()
    return {"1" => "January",
            "2" => "February",
            "3" => "March",
            "4" => "April",
            "5" => "May",
            "6" => "June",
            "7" => "July",
            "8" => "August",
            "9" => "September",
            "10" => "October",
            "11" => "November",
            "12" => "December"
          }
  end

  def self.find_month_number(month_name)
    month_no = self.all().index(month_name)
    return month_no
  end

  def self.find_month_name(month_no)
    month_name = self.all()[month_no]
    return month_name
  end
end
