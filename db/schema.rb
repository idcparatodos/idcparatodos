# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_22_190430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "redes", force: :cascade do |t|
    t.string "nome"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_redes_on_nome", unique: true
    t.index ["token"], name: "index_redes_on_token", unique: true
  end

  create_table "registros", force: :cascade do |t|
    t.string "nome"
    t.string "valor"
    t.integer "tipo"
    t.bigint "rede_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome", "rede_id"], name: "index_registros_on_nome_and_rede_id", unique: true
    t.index ["rede_id"], name: "index_registros_on_rede_id"
  end

  add_foreign_key "registros", "redes"
end
