class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:member, :admin]

  enum level: [:trainee, :junior, :middle, :senior]

  after_initialize :set_default_level, :set_default_role, :if => :new_record?

  def set_default_level
    self.level ||= :junior
  end

  def set_default_role
    self.role ||= :member
  end

end
