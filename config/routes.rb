Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # root
  root 'shops#index'

  # # redirect
  # get '/reviews' => redirect('/reviews/new')

  # google login
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :sessions, only: %i(create destroy)

  # mypage
  get 'mypage', to: 'users#mypage', as: :mypage

  # all shops
  get 'all', to: 'shops#all', as: :all_shops

  # search form page
  get 'search_form', to: 'shops#search_form', as: :search_form

  # search
  get 'search', to: 'shops#search', as: :search

  # new shop results page
  get 'new_shop_result', to: 'shops#new_shop_results', as: :new_shop_results

  # new shop form
  get 'new_form', to: 'shops#new_form', as: :new_form

  # add new shop & show shop detail
  resources :shops, only: %i(create show) do
    collection do
      get :search_result
    end
  end

  # new review form & add new review & delete review
  resources :reviews, only: %i(new create destroy)

  # wants list page
  resources :users do
    resources :wants, except: %i(edit show update)
  end
end
