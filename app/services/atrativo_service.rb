class AtrativoService
  attr_reader :base_url, :atrativo_id, :start_date, :end_date

  def initialize
    @base_url = 'https://bonitour-test-api.herokuapp.com'
  end

  def atrativos
    url     = @base_url + '/attractions/'
    request = RestClient.get url
    parse(request)
  end

  def atrativo(codigo, start_date, end_date)
    url     = @base_url + '/attractions/' + codigo.to_s
    request = RestClient.get url, params: { start_date: start_date, end_date: end_date }
    parse(request)
  end

  def parse(request)
    JSON.parse(request.body)
  end
end