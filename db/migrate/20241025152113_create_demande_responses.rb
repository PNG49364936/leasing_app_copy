class CreateDemandeResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :demande_responses do |t|
      t.string :numero_demande
      t.string :message
      t.integer :code
      t.references :demande, null: false, foreign_key: true

      t.timestamps
    end
  end
end
