class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = [
    ROLE_ADMIN = "Admin",
    ROLE_REGULAR = "Regular"
]

devise :invitable, :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable


validates :first_name, presence: true, length: { maximum: 50 }
validates :last_name, presence: true, length: { maximum: 50 }
validates :role, inclusion: ROLES, presence: true

before_validation :set_role

def full_name
  [first_name, last_name].join(" ")
end

def admin?
  self.role == ROLE_ADMIN
end

private
def set_role
  self.role = ROLE_REGULAR if self.role.blank?
end
end
