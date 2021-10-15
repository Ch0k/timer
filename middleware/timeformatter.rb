class TimeFormatter

  FORMAT = {"year"=> "%Y", "month"=> "%m", "day"=>"%d", "hour"=>"%H", "minute"=>"%M", "second"=>"%S"}

  attr_reader :false_result

  def initialize(query)
    @query = query
  end

  def success?
    @false_result.empty?
  end

  def call
    @query = @query[6,50]
    time_params = @query.split("%2C")
    @false_result = time_params - FORMAT.keys 
    if @false_result.empty?
      @string_array = []
      result = time_params & FORMAT.keys
      FORMAT.each do |key,val|
        if result.include?(key)
          @string_array << val
        end
      end
    end
  end

  def time
    Time.now.strftime "#{time_content}"
  end

  def time_content
    @string_array.join(' ')
  end

end
