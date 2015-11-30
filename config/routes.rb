Rails.application.routes.draw do
  
  #get 'sessions/index'
   root 'welcome#index'
  #match 'auth/:provider/callback', to:'sessions#create'
  #match 'auth/failure', to: redirect('/')
  #match 'signout', to: 'sessions#destroy', as:'signout'
  
  resources :stories
  resources :chapters
  resources :scenarios
  resources :readings

get 'auth/:provider/callback', to: 'sessions#create'
get 'auth/failure', to: redirect('/')
get 'signout', to: 'sessions#destroy', as: 'signout'
  #get 'readings/index'

  #get 'readings/show'

  #get 'readings/new'

  #get 'scenarios/index'

  #get 'scenarios/show'

  #get 'scenarios/new'

  #get 'chapters/index'

  #get 'chapters/show'

  #get 'chapters/new'

  #get 'stories/index'

  #get 'stories/show'

  #get 'stories/new'

  #get 'welcome/index'

  #get 'auth/:provider/callback', to: 'sessions#create'
  #get 'auth/failure', to: redirect('/')
  #get 'signout', to: 'sessions#destroy', as: 'signout'

   #devise_for :users, controllers: {
        #sessions: 'users/sessions'
      #}
    # end
devise_for :admins
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_for :users
#delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#end
  

http_path = 'welcome#index'
css_dir = "css"
sass_dir = "scss"
images_dir = "images"
javascripts_dir = "js"
fonts_dir = "fonts"

output_style = :expanded

color_output = false
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
