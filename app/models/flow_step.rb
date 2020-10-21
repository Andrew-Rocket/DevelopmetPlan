class FlowStep < ApplicationRecord
  belongs_to :plan
  has_many :tasks
end
