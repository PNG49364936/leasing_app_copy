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
  validates :duree_unit, presence: true, inclusion: { in: ['jours', 'mois', 'semestres'] }

  DUREE_UNITS = [
    ['Jours', 'jours'],
    ['Mois', 'mois'],
    ['Semestres', 'semestres']
  ]
  def duree_en_jours
    case duree_unit
    when 'jours'
      duree_value
    when 'mois'
      duree_value * 30
    when 'semestres'
      duree_value * 180
    end
  end
  def duree_en_mois
    case duree_unit
    when 'jours'
      (duree_value.to_f / 30).round(2)
    when 'mois'
      duree_value
    when 'semestres'
      duree_value * 6
    end
  end

  def duree_en_semestres
    case duree_unit
    when 'jours'
      (duree_value.to_f / 180).round(2)
    when 'mois'
      (duree_value.to_f / 6).round(2)
    when 'semestres'
      duree_value
    end
  end

  def self.duree_units
    DUREE_UNITS
  end




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