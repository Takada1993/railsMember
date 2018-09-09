Rails.application.routes.draw do
  
  # member_input
  post 'member_input/input'
  get 'member_input/input'
  post 'member_input/confirm'
  get 'member_input/confirm'
  get 'meber_input/confirmation'
  get 'member_input/completion'
  post 'member_input/create'
  get 'member_input/create'
  patch 'members/create'
  get 'member_input/login'
  
  # article
  get 'article/top'
  post 'article/search'
  get 'article/article_list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
