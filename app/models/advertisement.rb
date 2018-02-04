# == Schema Information
#
# Table name: advertisements
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :string
#  city            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  status          :string
#  user_id         :integer
#  private_user_id :integer
#

class Advertisement < ApplicationRecord
  has_and_belongs_to_many :interesters, class_name: User.name
  has_many :comments, -> { where(is_private: false)}
  belongs_to :private_user, class_name: User.name, optional: true
  has_many :private_comments, -> { where(is_private: true)}, class_name: Comment.name


  def interested?(user)
    self.interesters.exists?(user.id)
  end
end
