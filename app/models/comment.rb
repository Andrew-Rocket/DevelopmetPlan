# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  validates :commentable_id, uniqueness: { scope: :user_id, message: 'You may leave only one comment per task' }
end
