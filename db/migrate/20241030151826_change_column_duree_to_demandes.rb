class ChangeColumnDureeToDemandes < ActiveRecord::Migration[6.1]
  def change
    # Changer la colonne durée pour qu'elle accepte une valeur et une unité
    rename_column :demandes, :duree, :old_duree
    add_column :demandes, :duree_value, :integer
    add_column :demandes, :duree_unit, :string, default: 'mois'

    # Migration des données existantes
    reversible do |dir|
      dir.up do
        Demande.reset_column_information
        Demande.find_each do |demande|
          demande.update_columns(
            duree_value: demande.old_duree,
            duree_unit: 'mois'
          )
        end
      end
    end

    # Suppression de l'ancienne colonne
    remove_column :demandes, :old_duree
  end
end