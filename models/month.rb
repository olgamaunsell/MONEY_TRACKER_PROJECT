class Month
  def self.all()
    return ["January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"]
  end

  def self.find(month_no)
    index = month_no - 1
    month_name = self.all[index]
    return month_name
  end
end
