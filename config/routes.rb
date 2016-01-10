
Rails.application.routes.draw do


  devise_for :companies ,controllers: {
                 sessions: "companies/sessions",
                 registrations: "companies/registrations"

                        }
  devise_for :users ,controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations"

              }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'


  get  '/vacancy'   =>  'vacancy#index'

  post  '/vacancy/search' => 'vacancy#search'
  get  '/vacancy/search' => 'vacancy#search'

  get  '/vacancy/show'  => 'vacancy#show'



  post '/vacancy/sub_resume' => 'vacancy#sub_resume'

  get  '/resume'     =>'resume#index'
  post '/resume/create_base_info' => 'resume#create_base_info'
  post  '/resume/create_contact'  =>'resume#create_contact'


  post  '/resume/create_edu'   => 'resume#create_edu'
  get '/resume/delete_edu'   =>'resume#delete_edu'
  get  '/resume/edit_edu'   =>'resume#edit_edu'
  post  'resume/update_edu' =>'resume#update_edu'

  post  '/resume/create_exp' =>'resume#create_exp'
  get  '/resume/edit_exp'  => 'resume#edit_exp'
  post '/resume/update_exp' =>'resume#update_exp'
  get  '/resume/delete_exp'  => 'resume#delete_exp'

  post '/resume/create_avatar' => 'resume#create_avatar'

  get 'resume/show'   =>  'resume#show'


  get '/interview'   => 'interview#index'
  get '/interview/invite/:id' =>'interview#invite'

  get '/interview/refuse/:id' => 'interview#refuse'


    get '/company'  => 'company#index'




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
