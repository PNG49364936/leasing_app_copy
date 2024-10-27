class AddBanqueToDemandes < ActiveRecord::Migration[6.1]
  def change
    add_column :demandes, :banque, :string, default: 'franfinance'
  end
end
