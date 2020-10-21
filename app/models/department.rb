class Department < ApplicationRecord
  include SharedScopes
  has_many :users
  has_one_attached :cover_img
end
