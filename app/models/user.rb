class User < ActiveRecord::Base
  has_many :roles, :through => :memberships
  has_many :memberships

  validates_uniqueness_of :username
  validates_presence_of :password
  
  before_validation :uniquify_username

  after_validation :hash_password

  # LOOK INTO  attr_accessible :first_name

  private
  
    def uniquify_username
      logger.debug username.class
      logger.debug username.method(:sub)
      self.username = self.username.sub("#", Time.now.to_s)
      logger.debug self.username
    end

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
#  id         :integer         not null, primary key
#  username   :string(255)     not null
#  first_name :string(255)     not null
#  last_name  :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#  password   :string(255)
#

