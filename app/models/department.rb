class Department < ApplicationRecord
  include SharedScopes
  has_many :users
  has_many :plans

  has_one_attached :cover_img
end
