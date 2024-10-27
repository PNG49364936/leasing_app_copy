# frozen_string_literal: true

class CreateBlocMateriels < ActiveRecord::Migration[6.1]
  def change
    create_table :bloc_materiels do |t|
      t.string :code_insee_materiel
      t.boolean :materiel_occasion
      t.string :annee_materiel
      t.string :code_niveau_utilisation_materiel
      t.string :code_niveau_options_materiel
      t.integer :nombre_materiel
      t.references :demande, null: false, foreign_key: true

      t.timestamps
    end
  end
end
