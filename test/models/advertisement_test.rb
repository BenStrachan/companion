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

require 'test_helper'

class AdvertisementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
