class Roteiro < ApplicationRecord
  has_many :atrativos
  has_many :localizacaos, through: :atrativos

  validates :dataSaida, presence: true
  validates :dataChegada, presence: true
  validates :qtdePessoas, presence: true

  def gerar_intinerario(atrativosHash)
    atrativosHash.map do |at|
      atrativo = Atrativo.new
      atrativo.codigo = at['id']
      atrativo.nome = at['name']
      atrativo.duracao = at['duration']
      atrativo.roteiro_id = self
      atrativo.save

      location = at['location']
      localizacao = Localizacao.new
      localizacao.latitude = location['lat']
      localizacao.longitude = location['long']
      localizacao.atrativo = atrativo
      localizacao.save
    end
  end
end
