# frozen_string_literal: true

class ChangeDateNaissanceToDateInBlocDirigeant < ActiveRecord::Migration[6.0]
  def change
    change_column :bloc_dirigeants, :date_naissance, :date
  end
end
