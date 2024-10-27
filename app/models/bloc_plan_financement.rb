# frozen_string_literal: true

# frozen_string_literal_true

class BlocPlanFinancement < ApplicationRecord
  belongs_to :demande

  validates :premier_loyer, presence: true
  validates :code_amortissement, presence: true
  validates :vr, presence: true
end
