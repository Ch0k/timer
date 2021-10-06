class TimerPath

  FORMAT = ["year", "month", "day", "hour", "minute", "second"]

  def initialize(app)
    @app = app
  end

  def call(env)
    @status, @headers, @body = @app.call(env)
    handle_request(env['REQUEST_PATH'], env['QUERY_STRING'])
  end

  def handle_request(path, query)
    if path == "/time"
      format(query)
      if format_allowed?
        [200, @headers, ["#{TimeFormatter.new.time_formatter(@data)}"]]
      else
        format_not_allowed
      end
    else
      path_not_allowed(path)
    end
  end

  def path_not_allowed(path)
    [404, {}, ["Path not allowed: #{path}"]]
  end

  def format_not_allowed
    [400, {}, ["Unknown time format #{unknow_time_format}"]]
  end

  def format(query)
    query = query[6,50]
    @data = query.split("%2C")
  end

  def unknow_time_format
    @data - FORMAT
  end

  def format_allowed?
    (@data - FORMAT).empty?
  end
  
end


