class Month
  def self.all()
    return {"01" => "January",
            "02" => "February",
            "03" => "March",
            "04" => "April",
            "05" => "May",
            "06" => "June",
            "07" => "July",
            "08" => "August",
            "09" => "September",
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
