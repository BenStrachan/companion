# == Schema Information
#
# Table name: advertisements
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  city        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :string
#

class Advertisement < ApplicationRecord
end
