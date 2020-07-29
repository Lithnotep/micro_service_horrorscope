class NeosService
  def current
    response = conn.get('neo/rest/v1/feed/today') do |req|
      req.params['detailed'] = 'false'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def harbinger(asteroid_id)
    response = conn.get("neo/rest/v1/neo/#{asteroid_id}") do |req|
      # req.params['asteroid_id'] = asteroid_id
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def birthday(start_date)
    response = conn.get('neo/rest/v1/feed') do |req|
      req.params['detailed'] = 'false'
      req.params['start_date'] = start_date
    end
    JSON.parse(response.body, symbolize_names: true)
  end


  private

  def conn
    Faraday.new('https://api.nasa.gov') do |f|
      f.params['api_key'] = ENV['nasa_key']
    end
  end
end
