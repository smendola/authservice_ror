require 'etc'

namespace :sample_data do
  
  def require_dev_environment()
    unless Rails.env.development?
      raise "Can only run this in dev environment"
    end
  end

  desc "Load sample data"
  task(:load => :environment) do

    require_dev_environment
    
    svc = AuthService.new

    svc.AddUser :username => 'smendola', :first_name=>'Salvatore', :last_name=>'Mendola', :password=>'123'
    svc.AddUser :username => 'jripper', :first_name=>'Jack', :last_name=>'Ripper', :password=>'123'
    svc.AddUser :username => 'jbauer', :first_name=>'Jack', :last_name=>'Bauer', :password=>'123'

    svc.AddRole :name=>'Admin'
    svc.AddRole :name=>'Reviewer'
    svc.AddRole :name=>'Guest'

    svc.AssignUserRoles 'smendola', ['Admin', 'Reviewer']
    svc.AssignUserRoles 'jbauer', ['Admin', 'Guest']
  end
end

