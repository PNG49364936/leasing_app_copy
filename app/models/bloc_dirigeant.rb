# frozen_string_literal: true

class BlocDirigeant < ApplicationRecord
  belongs_to :demande

  # Conversion automatique du format
  def date_naissance=(val)
    if val.is_a?(String)
      begin
        write_attribute(:date_naissance, Date.parse(val))
      rescue StandardError
        write_attribute(:date_naissance, val)
      end
    else
      write_attribute(:date_naissance, val)
    end
  end
end
