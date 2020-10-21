class Plan < ApplicationRecord
  belongs_to :department
  has_many :flow_steps
end
