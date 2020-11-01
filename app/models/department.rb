# frozen_string_literal: true

class Department < ApplicationRecord
  include SharedScopes
  has_many :users
  has_many :plans, dependent: :destroy

  has_one_attached :cover_img

  scope :search_by_title, ->(title) { where('(title like ?) OR title in (?)', "%#{title}%", title.split) }
end
