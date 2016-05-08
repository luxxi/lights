Rails.application.routes.draw do
  devise_for :users
  root 'lights#index'
end
