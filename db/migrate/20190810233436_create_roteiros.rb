class CreateRoteiros < ActiveRecord::Migration[5.2]
  def change
    create_table :roteiros do |t|
      t.date :dataChegada
      t.date :dataSaida
      t.integer :qtdePessoas

      t.timestamps
    end
  end
end
