# frozen_string_literal: true

class CreateDemandes < ActiveRecord::Migration[6.1]
  def change
    create_table :demandes do |t|
      t.string :reference_demande
      t.string :media
      t.string :login_vendeur
      t.string :duree
      t.string :montant
      t.string :nature
      t.string :numero_siren

      t.timestamps
    end
  end
end
