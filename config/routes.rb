Rails.application.routes.draw do


  devise_for :users, :skip => [:sessions], :controllers => { :registrations => "users" }


  resources :users do
    
    member do
      get 'bank_statement' => 'users#bank_statement'
    end

  end

  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session


    # unauthenticated do
    #   root 'devise/sessions#new', as: :unauthenticated_root
    # end

    resources :clients do
      get 'bank_statement', to: 'clients#bank_statement'
    end
    resources :sales
    resources :profiles
    resources :products
    resources :inventory_items
    resources :transactions
    resources :parties
    root 'devise/sessions#new'
  end


end
