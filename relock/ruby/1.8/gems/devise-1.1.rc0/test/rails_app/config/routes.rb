Rails::Application.routes.draw do
  resources :users, :only => [:index] do
    get :expire, :on => :member
  end

  resources :admins, :only => [:index]

  devise_for :users
  devise_for :admin, :as => "admin_area", :controllers => { :sessions => "sessions" }, :skip => :passwords
  devise_for :accounts, :scope => "manager", :path_prefix => ":locale",
    :class_name => "User", :path_names => {
      :sign_in => "login", :sign_out => "logout",
      :password => "secret", :confirmation => "verification",
      :unlock => "unblock", :sign_up => "register"
    }

  match "/admin_area/home", :to => "admins#index", :as => :admin_root
  match "/sign_in", :to => "devise/sessions#new"

  # Dummy route for new admin pasword
  match "/anywhere", :to => "foo#bar", :as => :new_admin_password

  root :to => "home#index"
end