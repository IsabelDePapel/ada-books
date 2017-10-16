Rails.application.routes.draw do
  # ORDER MATTERS HERE!!!
  # maps verb and path to route it's going to use

  root to: 'books#index'

  # can delete all the routes and replace with
  resources :genres, only: [:index, :show] do
    get '/books', to: 'books#index'
  end

  resources :books

  get '/login', to: 'sessions#login_form'
  post '/login', to: 'sessions#login'

  # get '/books', to: 'books#index', as: 'books' # books_path   this names the path (goes in server-side code)
  # # id here is a variable name (rails route notation)
  # get '/books/:id/edit', to: 'books#edit', as: 'edit_book' # edit_book_path
  #
  # get '/books/new', to: 'books#new', as: 'new_book' # new_book_path
  #
  # get '/books/:id', to: 'books#show', as: 'book' # book_path
  #
  # patch '/books/:id', to: 'books#update', as: 'update_book' # update_book_path
  #
  # post '/books/', to: 'books#create', as: 'create_book' # create_book_path
  #
  # delete '/books/:id', to: 'books#destroy', as: 'delete_book' # delete_book_path

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
