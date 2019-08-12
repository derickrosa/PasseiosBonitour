class Atrativo < ApplicationRecord
  has_one :localizacao
  has_many :disponibilidades
end
