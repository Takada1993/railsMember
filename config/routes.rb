Rails.application.routes.draw do
  
  #session
  get 'session/login'
  post 'session/login'
  get 'session/logout'
  post 'session/logout'

  # member_input
  get 'member_input/input'
  post 'member_input/input'
  get 'member_input/confirm'
  post 'member_input/confirm'
  get 'meber_input/confirmation'
  post 'meber_input/confirmation'
  get 'member_input/completion'
  get 'member_input/create'
  post 'member_input/create'
  patch 'members/create'
  get 'member_input/edit'
  post 'member_input/edit'
  get 'member_input/update'
  
  # article
  get 'article/top'
  post 'article/search'
  post 'article/article_list'
  get 'article/article_input'
  post 'article/article_input'
  get 'article/create'
  post 'article/create'
  get 'article/details'
  post 'article/show'
  
  
  post 'err/error'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
