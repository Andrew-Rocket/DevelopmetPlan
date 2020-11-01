# frozen_string_literal: true

module SharedScopes
  extend ActiveSupport::Concern

  included do
    scope :today, -> { where(created_at: DateTime.current.beginning_of_day::DateTime.current.end_of_day) }
  end
end
