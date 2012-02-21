class User < ActiveRecord::Base
  has_many :roles, :through => :memberships
  has_many :memberships

  validates_uniqueness_of :username
  validates_presence_of :password

  after_validation :hash_password

  private

    def hash_password
     if self.password_changed?
       self.password = Digest::MD5.hexdigest(self.password)
     end
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

