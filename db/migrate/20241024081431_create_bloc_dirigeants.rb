# frozen_string_literal: true

class CreateBlocDirigeants < ActiveRecord::Migration[6.1]
  def change
    create_table :bloc_dirigeants do |t|
      t.string :nom_naissance
      t.string :prenom
      t.string :nom_usuel
      t.string :date_naissance
      t.references :demande, null: false, foreign_key: true

      t.timestamps
    end
  end
end
