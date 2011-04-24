Doutdes01::Application.routes.draw do
  
  #just type in the entire addres errors/notfound404 and it should work right off the bat.
  get "errors/notfound404"
  get "errors/authorizednot"
  #need to route the above rotes to /404 and /500 etc
  get "unsubscribe/nomoreemailforyou"
  get "unsubscribe/resubscribe"
  get "unsubscribe/cancelsubscription"
  

  get "hithere/contact"
  get "hithere/about"
  get "hithere/feedback"
  get "hithere/errorpage"
  get "hithere/chat"
  
  resources :coupon_searches

  resources :simplealerts
  resources :administrator
  resources :businessforms
  resources :foocancans
  devise_for :users#, :path_prefix => ‘d’# , :path_names => {:sign_up => "register"}
  resources :user, :controller => "user"
  
  resources :coupons
  
  match ":name" => "outside_viewer#show", :as => :outside_viewerLinkeage# ORIGINAL HOME 
  match "/:redirect", :to => "errors#notfound404"  


  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "coupons#index"
  


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  match '*a', :to => 'errors#notfound404'# this only works if controller exists but not action
  
  
end
