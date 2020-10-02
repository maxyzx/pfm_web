Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :accounts
  resources :transactions

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
