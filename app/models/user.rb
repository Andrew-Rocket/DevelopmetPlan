# frozen_string_literal: true

class User < ApplicationRecord
  include SharedScopes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :invitable

  enum role: {
    member: 0,
    admin: 1
  }

  enum level: {
    trainee: 0,
    junior: 1,
    middle: 5,
    senior: 10
  }

  validates :first_name, presence: true
  validates :last_name, presence: true

  belongs_to :department

  has_many :task_states

  has_one_attached :avatar

  scope :with_first_name, -> { where.not(first_name: [nil, '']) }
end
