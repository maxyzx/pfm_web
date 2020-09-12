Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users
  resources :accounts do
    get :edit_form, on: :member
  end
end
