class CreateLocalizacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :localizacaos do |t|
      t.decimal :latitude, precision: 64, scale: 12
      t.decimal :longitude, precision: 64, scale: 12
      t.references :atrativo, foreign_key: true

      t.timestamps
    end
  end
end
