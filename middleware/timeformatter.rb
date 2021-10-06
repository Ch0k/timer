class TimeFormatter

  def initialize
  end

  def time_formatter(format)
    str = ''
    format.each do |data|
      if data == "year"
        str = "%Y-"
      elsif data == "month"
        str += (Time.now.month.to_s + '-') 
      elsif data == "day"
        str += (Time.now.day.to_s + '-')
      elsif data == "hour"
        str += (Time.now.hour.to_s + '-')
      elsif data == "minute"
        str += (Time.now.min.to_s + '-')
      elsif data == "second"
        str += (Time.now.sec.to_s + '-')
      end
    end
    str[0...-1]
  end
end
