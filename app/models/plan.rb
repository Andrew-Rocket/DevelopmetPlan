# frozen_string_literal: true

class Plan < ApplicationRecord
  belongs_to :department
  has_many :flow_steps, dependent: :destroy
end
