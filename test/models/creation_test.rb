# == Schema Information
#
# Table name: creations
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_creations_on_user_id  (user_id)
#
require 'test_helper'

class CreationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
