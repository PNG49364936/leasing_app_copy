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

ActiveRecord::Schema.define(version: 2024_10_29_210347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bloc_dirigeants", force: :cascade do |t|
    t.string "nom_naissance"
    t.string "prenom"
    t.string "nom_usuel"
    t.date "date_naissance"
    t.bigint "demande_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demande_id"], name: "index_bloc_dirigeants_on_demande_id"
  end

  create_table "bloc_materiels", force: :cascade do |t|
    t.string "code_insee_materiel"
    t.boolean "materiel_occasion"
    t.string "annee_materiel"
    t.string "code_niveau_utilisation_materiel"
    t.string "code_niveau_options_materiel"
    t.integer "nombre_materiel"
    t.bigint "demande_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demande_id"], name: "index_bloc_materiels_on_demande_id"
  end

  create_table "bloc_plan_financements", force: :cascade do |t|
    t.string "premier_loyer"
    t.string "code_amortissement"
    t.string "vr"
    t.bigint "demande_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demande_id"], name: "index_bloc_plan_financements_on_demande_id"
  end

  create_table "demande_responses", force: :cascade do |t|
    t.string "numero_demande"
    t.string "message"
    t.integer "code"
    t.bigint "demande_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["demande_id"], name: "index_demande_responses_on_demande_id"
  end

  create_table "demandes", force: :cascade do |t|
    t.string "reference_demande"
    t.string "media"
    t.string "login_vendeur"
    t.string "duree"
    t.string "montant"
    t.string "nature"
    t.string "numero_siren"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "banque", array: true
  end

  add_foreign_key "bloc_dirigeants", "demandes"
  add_foreign_key "bloc_materiels", "demandes"
  add_foreign_key "bloc_plan_financements", "demandes"
  add_foreign_key "demande_responses", "demandes"
end
