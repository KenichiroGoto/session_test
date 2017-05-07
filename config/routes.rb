Rails.application.routes.draw do

  resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
  end

  resources :users, only: [:index, :destroy]

  root 'top#index'

end
