class App
  
  def call(env)
    handle_request(env['REQUEST_PATH'], env['QUERY_STRING'])
  end

  private

  def send(status, body)
    response = Rack::Response.new
    [response.status = status, response.headers, response.body = [body]]
  end

  def handle_request(path, query)
    if path == "/time"
      format_handler(query)
    else
      path_not_allowed(path)
    end
  end

  def format_handler(query)
    response = TimeFormatter.new(query)
    response.call
    if response.success?
      send(200, response.time)
    else
      send(404, "Unknown time format #{response.false_result}")
    end
  end

  def path_not_allowed(path)
    send(400, "Path not allowed: #{path}")
  end
end
