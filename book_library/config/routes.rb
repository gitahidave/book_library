Rails.application.routes.draw do
  resources :books do
    member do
      post 'borrow'
      post 'return'
    end
  end
  
  get 'borrowers/:name', to: 'borrowers#show', as: 'borrower'
  root 'books#index'
end