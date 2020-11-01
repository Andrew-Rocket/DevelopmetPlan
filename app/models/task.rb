# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :flow_step
  has_many :comments, as: :commentable
  has_many :task_states, dependent: :destroy

  has_rich_text :description

  enum level: User.levels
end
