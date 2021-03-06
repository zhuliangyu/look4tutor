Rails.application.routes.draw do

  resources :charges, only:[:create,:new]


  # routes for api
  namespace :api do
    namespace :v1 do
      resources :tutors, only: [:index, :show]
    end
  end


  get 'chattings/index'

  post '/conversations/:user_id', to: 'conversations#create', as: 'tutor_direct_message'


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root to: "home#index"

  get '/search', to: 'tutors#search', as: 'search'

  get '/changeState/:id', to: 'tutors#changeState', as: 'changeState'

  resource :sessions

  resources :users

  resources :tutors, shallow: true do
    resources :comments
    resources :events


  end


  resources :conversations do
    resources :messages

  end


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
