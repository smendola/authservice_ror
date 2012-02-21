class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  has_one :user
  has_one :role
end


# == Schema Information
#
# Table name: memberships
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  role_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

