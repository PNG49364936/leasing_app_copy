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
  validates :media, presence: true
  validates :login_vendeur, presence: true


  validates :banque, presence: true
  validates :banque, inclusion: { in: ['franfinance', 'grenke'] }

  # Pour faciliter l'accès aux options de banque dans les vues
  def self.banque_options
    [
      ['Franfinance', 'franfinance'],
      ['Grenke', 'grenke']
    ]
  end
end
