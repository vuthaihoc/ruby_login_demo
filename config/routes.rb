Rails.application.routes.draw do


  #user controller
  get    '/users(.:format)'          => 'users#index', as: :users
  post   '/users(.:format)'          => 'users#create',    as: :users_post
  get    '/users/new(.:format)'      => 'users#new',   as: :new_user
  get    '/users/:id/edit(.:format)' => 'users#edit',    as: :edit_user, constraints: {id: /[0-9]+/}
  get    '/users/:id(.:format)'      => 'users#show' ,   as: :user, constraints: {id: /[0-9]+/}
  patch  '/users/:id(.:format)'      => 'users#update',    as: :users_patch, constraints: {id: /[0-9]+/}
  put    '/users/:id(.:format)'      => 'users#update' ,   as: :users_put, constraints: {id: /[0-9]+/}
  delete '/users/:id(.:format)'      => 'users#destroy' ,  as: :users_destroy, constraints: {id: /[0-9]+/}
  get    '/users/register(.:format)' => 'users#register', as: :users_register
  post   '/users/register(.:format)' => 'users#register', as: :users_register_post
  get    '/profile'                  => 'users#profile', as: :users_profile_path 

  #authentication routers
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#register',            via: 'get'
  match '/signin',  to: 'sessions#new',             via: 'get'
  match '/signout', to: 'sessions#destroy',         via: 'delete', as: :user_signout

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

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
