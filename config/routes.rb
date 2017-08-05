Rails.application.routes.draw do


  root      'static_pages#home'
  post      '/',          to: 'static_pages#home'
  get       'category',   to: 'static_pages#category'
  post      'category',   to: 'static_pages#category'
  get       'login',      to: 'session#new'
  post      'login',      to: 'session#create'
  get       'logout',     to: 'session#destroy'
  get       'mypage',     to: 'mypage#top'
  post      'mypage',     to: 'mypage#top'


  resources :tips
  resources :users
end
