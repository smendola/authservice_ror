require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  username   :string(255)     not null
#  first_name :string(255)     not null
#  last_name  :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#  password   :string(255)
#

