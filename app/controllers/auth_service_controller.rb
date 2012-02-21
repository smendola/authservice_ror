require "auth_service"

class AuthServiceController < ApplicationController

  json_rpc_service :name     => 'AuthService',                                   # required
                   :id       => 'urn:uuid:fdba4820-276b-11dc-ab85-0002a5d5c51b', # required
                   :version  => '0.1',                                           # optional
                   :summary  => 'Authentication Service Prototype',              # optional
                   :help     => 'http://127.0.0.1:3000/service/index.html',      # optional
                   :address  => 'http://127.0.0.1:3000/service',                 # optional
                   :disabled => false,                                           # optional 
                   :logger   => RAILS_DEFAULT_LOGGER                             # optional


  # TODO: Is it possible to clean up all the :proc => AuthService.new.method(:xxx) 's?
  json_rpc_procedure :name       => 'ListUsers', :proc => AuthService.new.method(:ListUsers),
                     :summary    => 'Lists all users.',
                     :params     => [],
                     :return     => {:type => 'arr'},
                     :idempotent => true

  json_rpc_procedure :name       => 'GetUser', :proc => AuthService.new.method(:GetUser),
                     :summary    => 'Get a User',
                     :params     => [{:name => 'username', :type => 'str'}],
                     :return     => {:type => 'obj'},
                     :idempotent => true

  json_rpc_procedure :name       => 'DeleteUser', :proc => AuthService.new.method(:DeleteUser),
                     :summary    => 'Get a User (by username)',
                     :params     => [{:name => 'username', :type => 'str'}],
                     :return     => {:type => 'obj'},
                     :idempotent => false

  json_rpc_procedure :name       => 'AddUser', :proc => AuthService.new.method(:AddUser),
                     :summary    => 'Add a User',
                     :params     => [{:name => 'user', :type => 'obj'}],
                     :return     => {:type => 'obj'},
                     :idempotent => false

  json_rpc_procedure :name       => 'UpdateUser', :proc => AuthService.new.method(:UpdateUser),
                     :summary    => 'Update a User',
                     :params     => [{:name => 'user', :type => 'obj'}],
                     :return     => {:type => 'obj'},
                     :idempotent => false


  json_rpc_procedure :name       => 'AddRole', :proc => AuthService.new.method(:AddRole),
                     :summary    => 'Add a Role',
                     :params     => [{:name => 'role', :type => 'obj'}],
                     :return     => {:type => 'obj'},
                     :idempotent => false

  json_rpc_procedure :name       => 'ListRoles', :proc => AuthService.new.method(:ListRoles),
                     :summary    => 'Lists all roles.',
                     :params     => [],
                     :return     => {:type => 'arr'},
                     :idempotent => true

  json_rpc_procedure :name       => 'ListUsersInRole', :proc => AuthService.new.method(:ListUsersInRole),
                     :summary    => 'Lists all users in given role.',
                     :params     => [{:name => 'role_name', :type => 'str'}],
                     :return     => {:type => 'arr'},
                     :idempotent => true


  json_rpc_procedure :name       => 'AssignUserRoles', :proc => AuthService.new.method(:AssignUserRoles),
                     :summary    => 'Authenticate a User',
                     :params     => [
                                     {:name => 'username', :type => 'str'}, 
                                     {:name => 'role_names', :type => 'arr'}
                                    ],
                     :return     => {:type => 'obj'},
                     :idempotent => false

  json_rpc_procedure :name       => 'IsUserInRole', :proc => AuthService.new.method(:IsUserInRole),
                     :summary    => 'Does user have the role?',
                     :params     => [
                                     {:name => 'username', :type => 'str'}, 
                                     {:name => 'role_name', :type => 'str'}
                                    ],
                     :return     => {:type => 'obj'},
                     :idempotent => true

  json_rpc_procedure :name       => 'AuthenticateUser', :proc => AuthService.new.method(:AuthenticateUser),
                     :summary    => 'Authenticate a User',
                     :params     => [
                                     {:name => 'username', :type => 'str'}, 
                                     {:name => 'password', :type => 'str'}
                                    ],
                     :return     => {:type => 'obj'},
                     :idempotent => true
end
