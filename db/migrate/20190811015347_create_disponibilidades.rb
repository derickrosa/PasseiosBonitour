class CreateDisponibilidades < ActiveRecord::Migration[5.2]
  def change
    create_table :disponibilidades do |t|
      t.datetime :dataHora
      t.integer :vagas
      t.boolean :fixo, default: false
      t.references :atrativo, foreign_key: true

      t.timestamps
    end
  end
end
