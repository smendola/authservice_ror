require 'test_helper'

class AuthServiceTest < ActiveSupport::TestCase
  @@svc = AuthService.new

  test "all methods present" do
    assert @@svc.method(:ListUsers)
  end


  test "ListUsers returns the two" do
    users = @@svc.ListUsers
    assert users.length == 2
  end
end
