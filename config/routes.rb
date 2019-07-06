Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users, :path => 'u'
  resources :users


  resources :reservation_weeks do
    get 'pick', on: :collection
  end

  resources :reservations do
    get 'pick', on: :collection
    post 'lookup', on: :collection
    get 'reslookup', on: :collection
  end

  resources :public_pins

  #resources :pages

  resources :notes do
    get 'pick', on: :collection
  end

  get 'contact' => 'pages#contact'
  get 'library' => 'pages#library'
  get 'membership' => 'visitors#membership', as: 'membership'
  get 'guest' => 'visitors#guest', as: 'guest'
  #get 'notes' =>  'pages#note'
  get 'race' => 'pages#race'
  get 'social'=> 'pages#social'
  get 'ullr_lunch_2017' => 'pages#ullr_lunch_2017'
  get 'volleyball' => 'pages#volleyball', as: 'volleyball'
  get 'at_week' => 'pages#at_week', as: 'at_week'
  #get 'pages' => 'pages#index'
  #get 'users/new' => 'users#create'
end
