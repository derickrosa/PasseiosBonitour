class CreateAtrativos < ActiveRecord::Migration[5.2]
  def change
    create_table :atrativos do |t|
      t.integer :codigo, limit: 8
      t.string :nome
      t.integer :duracao
      t.references :roteiro, foreign_key: true, null: true

      t.timestamps
    end
  end
end
