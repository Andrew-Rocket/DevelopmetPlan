class User < ApplicationRecord
  include SharedScopes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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

  validates :last_name, presence: true

  belongs_to :department

  has_one_attached :avatar

  scope :with_first_name, -> { where.not(first_name: [nil, '']) }

end
