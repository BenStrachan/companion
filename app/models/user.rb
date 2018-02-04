# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  role                   :string
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_type        :string
#  invited_by_id          :integer
#  invitations_count      :integer          default(0)
#  status                 :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = [
    ROLE_ADMIN = "Admin",
    ROLE_REGULAR = "Regular"
  ]

  STATUS = [
    STATUS_ONLINE = "Online",
    STATUS_OFFLINE = "Offline",
    STATUS_INVISIBLE = "Invisible"
  ]

devise :invitable, :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable

has_attached_file :avatar, styles: { medium: "450x450>" }
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

validates :first_name, presence: true, length: { maximum: 50 }
validates :last_name, presence: true, length: { maximum: 50 }
validates :role, inclusion: ROLES, presence: true

before_validation :set_role

has_many :ads, class_name: Advertisement::name

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
