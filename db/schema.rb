# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_11_015347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atrativos", force: :cascade do |t|
    t.bigint "codigo"
    t.string "nome"
    t.integer "duracao"
    t.bigint "roteiro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roteiro_id"], name: "index_atrativos_on_roteiro_id"
  end

  create_table "disponibilidades", force: :cascade do |t|
    t.datetime "dataHora"
    t.integer "vagas"
    t.boolean "fixo", default: false
    t.bigint "atrativo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atrativo_id"], name: "index_disponibilidades_on_atrativo_id"
  end

  create_table "localizacaos", force: :cascade do |t|
    t.decimal "latitude", precision: 64, scale: 12
    t.decimal "longitude", precision: 64, scale: 12
    t.bigint "atrativo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atrativo_id"], name: "index_localizacaos_on_atrativo_id"
  end

  create_table "roteiros", force: :cascade do |t|
    t.date "dataChegada"
    t.date "dataSaida"
    t.integer "qtdePessoas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "atrativos", "roteiros"
  add_foreign_key "disponibilidades", "atrativos"
  add_foreign_key "localizacaos", "atrativos"
end
