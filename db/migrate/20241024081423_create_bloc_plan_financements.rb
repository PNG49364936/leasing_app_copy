# frozen_string_literal: true

class CreateBlocPlanFinancements < ActiveRecord::Migration[6.1]
  def change
    create_table :bloc_plan_financements do |t|
      t.string :premier_loyer
      t.string :code_amortissement
      t.string :vr
      t.references :demande, null: false, foreign_key: true

      t.timestamps
    end
  end
end
