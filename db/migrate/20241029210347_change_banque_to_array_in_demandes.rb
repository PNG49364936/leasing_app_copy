class ChangeBanqueToArrayInDemandes < ActiveRecord::Migration[6.1]
  def up
    # D'abord, supprime la valeur par défaut existante
    change_column_default :demandes, :banque, nil

    # Ensuite, convertit en array
    execute('ALTER TABLE demandes ALTER COLUMN banque TYPE character varying[] USING ARRAY[banque]')

    # Enfin, définit la nouvelle valeur par défaut
    execute('ALTER TABLE demandes ALTER COLUMN banque SET DEFAULT ARRAY[]::character varying[]')
  end

  def down
    change_column_default :demandes, :banque, nil
    execute('ALTER TABLE demandes ALTER COLUMN banque TYPE character varying USING banque[1]')
  end
end
