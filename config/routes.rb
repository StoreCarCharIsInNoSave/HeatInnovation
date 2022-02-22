Rails.application.routes.draw do
  devise_for :users
  root 'pages#main'

  get 'pages/reviews'
  post 'pages/reviews', to: 'pages#new_review'
  delete 'pages/destroy/:id', to: 'pages#destroy', as: 'destroy_review'
  get 'profile/update', to: 'profile#update'
  post 'profile/update', to: 'profile#edit'
  get 'unit/index', to: 'unit#index'
  get 'unit/new', to: 'unit#new'
  post 'unit/new', to: 'unit#create'
  get 'unit/show/:id', to: 'unit#show', as: 'unit_show'
  get 'unit/edit/:id', to: 'unit#edit', as: 'unit_edit'
  post 'unit/edit/:id', to: 'unit#update'
  delete 'unit/destroy/:id', to: 'unit#destroy', as: 'unit_destroy'
  get 'contacts/', to: 'pages#contacts'
  get 'teachers/', to: 'pages#teachers'
  get 'story/', to: 'pages#story'
  get 'administration/', to: 'pages#administration'
  get 'news/', to: 'pages#news'
  post 'contacts/', to: 'pages#contacts_send'
  get 'questions', to: 'pages#questions'
  delete 'questions/destroy/:id', to: 'pages#destroy_question', as: 'destroy_question'
  get 'answers', to: 'answer#index'

  post 'answers', to: 'answer#create', as: 'create_answer'
  get 'services/', to: 'service#index'
  get 'services/new', to: 'service#new'
  delete 'services/destroy/:id', to: 'service#destroy', as: 'destroy_service'
  post 'services/new', to: 'service#create'
  post 'services/edit/:id', to: 'service#update', as: 'update_service'
  get 'services/edit/:id', to: 'service#edit', as: 'edit_service'


  get 'workers/', to: 'workers#index'
  get 'workers/new', to: 'workers#new'
  delete 'workers/destroy/:id', to: 'workers#destroy', as: 'destroy_worker'
  post 'workers/new', to: 'workers#create'
  post 'workers/edit/:id', to: 'workers#update', as: 'update_worker'
  get 'workers/edit/:id', to: 'workers#edit', as: 'edit_worker'

end
