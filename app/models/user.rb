# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  device_id  :string
#
class User < ApplicationRecord
  has_many :creations

  validates :username, presence: true, uniqueness: true
  validates :device_id, presence: true, uniqueness: true
end
