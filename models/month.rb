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

  def self.find(month_no)
    index = month_no - 1
    month_name = self.all[index]
    return month_name
  end
end
