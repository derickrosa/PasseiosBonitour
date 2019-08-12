class Roteiro < ApplicationRecord
  has_many :atrativos
  has_many :localizacaos, through: :atrativos
end
