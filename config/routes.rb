OrderApp::Application.routes.draw do
  
  get "order_tickets/new"
  get "order_tickets/create"
  get "order_tickets/index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :stores, only: [:edit, :update, :show] 
  resources :users, except: [:new, :show, :index] 
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: :create
  resources :store_sessions, only: :create
  resources :meal_limits, only: [:create, :destroy]
  resources :orders, only: [:new, :create, :show]
  resources :password_recovery
  
  root 'static_pages#home'
  
  match '/signup',  to: 'users#new',  via: 'get'
  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  match '/store/signin', to: 'store_sessions#new', via: 'get'
  match '/store/signout', to: 'store_sessions#destroy', via: 'delete'


  match '/about', to: 'static_pages#about', via: 'get'
  match '/help', to: 'static_pages#help', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/privacy', to: 'static_pages#privacy', via: 'get'
  match '/view_stores', to: 'static_pages#stores_index', via: 'get'
  match '/close_stores', to: 'static_pages#close_store_list', via: 'get'

  match '/store/meal_index', to: 'meal_limits#index', via: 'get'

  match '/past_meals', to: 'meals#index', via: 'get'
  match '/meal/:id', to: 'meals#show', via: 'get', as: 'meal'
  match '/order_history/:id', to: 'meals#order_history', via: 'get', as: 'order_history'

  match '/store/meal/:id', to: 'meal_limits#show', via: 'get', as: 'select_meal'

  match '/store/current_orders', to: 'store_orders#todays_orders', via: 'get'
  match '/store/ready_for_pickup', to: 'store_orders#ready_for_pickup', via: 'patch'
  match '/store/pickup_list', to: 'store_orders#pickup_list', via: 'get'
  match '/store/past_orders', to: 'store_orders#past_orders', via: 'get'
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
