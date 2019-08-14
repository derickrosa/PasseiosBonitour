class Atrativo < ApplicationRecord
  has_one :localizacao
  has_many :disponibilidades

  validates :codigo, presence: true
  validates :duracao, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :nome, presence: true

end
