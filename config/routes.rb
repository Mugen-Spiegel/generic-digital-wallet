Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"



  resources :entity do
    collection do
      post :login
    end
  end
  namespace :transactions do
    namespace :credit do
      resources :bank_credit
      resources :cash_credit
      resources :wallet_credit
    end

    namespace :debit do
      resources :bank_debit
      resources :cash_debit
      resources :wallet_debit
    end
  end
end
