# == Schema Information
#
# Table name: notifications
#
#  id      :integer          not null, primary key
#  content :text
#  user_id :integer
#  link    :text
#

class Notification < ApplicationRecord
  belongs_to :user, optional: true
end
