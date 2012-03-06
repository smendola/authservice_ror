Authservice::Application.routes.draw do

  # Resource route (maps HTTP verbs to controller actions automatically):
#  resources :user, :defaults => { :format => 'json' }

  # Auth service route
  match '/service/auth(/:method)', :to => 'auth_service#receive_json_rpc_request'
end
