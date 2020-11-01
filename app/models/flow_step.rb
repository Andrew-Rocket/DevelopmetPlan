# frozen_string_literal: true

class FlowStep < ApplicationRecord
  belongs_to :plan
  has_many :tasks, dependent: :destroy
end
