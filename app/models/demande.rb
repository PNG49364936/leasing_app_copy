# frozen_string_literal: true

class Demande < ApplicationRecord
  has_one :bloc_plan_financement, dependent: :destroy
  has_one :bloc_materiel, dependent: :destroy
  has_one :bloc_dirigeant, dependent: :destroy
  has_one :demande_response

  accepts_nested_attributes_for :bloc_plan_financement,
                                :bloc_materiel,
                                :bloc_dirigeant,
                                allow_destroy: true

  validates :reference_demande, presence: true, uniqueness: true
  validates :media, presence: true, inclusion: { in: ['WSFL', 'AUTRES'] }
  validates :login_vendeur, presence: true
  validates :banque, presence: true
  validate :validate_banques



  BANQUES_DISPONIBLES = ['franfinance', 'grenke', 'bnp', 'siemens'].freeze

  # Pour faciliter l'accès aux options de banque dans les vues
  def self.banque_options
    [
      ['Franfinance', 'franfinance'],
      ['Grenke', 'grenke'],
      ['BNP', 'bnp'],
      ['Siemens', 'siemens']
    ]
  end

  def self.media_options
    [
      ['WSFL', 'WSFL'],
      ['AUTRES', 'Autres']
    ]
  end

  private

  def validate_banques
    return if banque.blank?
    invalid_banques = banque - BANQUES_DISPONIBLES
    if invalid_banques.any?
      errors.add(:banque, "contient des valeurs invalides : #{invalid_banques.join(', ')}")
    end
  end
end