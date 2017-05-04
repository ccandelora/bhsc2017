Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :reservation_weeks do
    get 'pick', on: :collection
  end

  resources :reservations do
    get 'pick', on: :collection
    post 'lookup', on: :collection
  end

  resources :public_pins

  #resources :pages

  get 'contact' => 'pages#contact'
  get 'guest' => 'pages#guest'
  get 'library' => 'pages#library'
  get 'membership' => 'pages#membership'
  get 'notes' =>  'pages#note'
  get 'race' => 'pages#race'
  get 'social'=> 'pages#social'
  #get 'pages' => 'pages#index'
end
