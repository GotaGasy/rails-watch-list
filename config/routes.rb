Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists, only: %i[index new show create] do
    resources :bookmarks, only: %i[new create]
    resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end
