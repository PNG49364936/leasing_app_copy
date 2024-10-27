# frozen_string_literal: true

class BlocMateriel < ApplicationRecord
  belongs_to :demande

  validates :code_insee_materiel, presence: true
  validates :materiel_occasion, inclusion: { in: [true, false] }
  validates :annee_materiel, presence: true
  validates :code_niveau_utilisation_materiel, presence: true
  validates :code_niveau_options_materiel, presence: true
  validates :nombre_materiel, presence: true, numericality: { only_integer: true }
end
