class AtrativoService
  attr_reader :base_url, :atrativo_id, :start_date, :end_date

  def initialize(id, start_date, end_date)
    @atrativo_id = id
    @start_date  = start_date
    @end_date    = end_date
    @base_url    = 'https://bonitour-test-api.herokuapp.com/'
  end

  def headers
    {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'start_date': @start_date,
        'end_date': @end_date
    }
  end

  def atrativos
    url     = @base_url + '/attractions/' + @atrativo_id
    request = RestClient.get(url, headers)
    parse(request)
  end

  def parse(request)
    JSON.parse(request.body)
  end
end