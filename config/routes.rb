Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  root to: "public#homepage"
  resources :favorites, only: [:create, :destroy, :show]
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :sessions, only: [:new, :create, :show, :destroy]
  get 'session/new'
  resources :blogs do
    collection do
      post :confirm
    end
  end
   #routes to errors
   get '404', :to => 'errors#not_found'
   get '500', :to => 'errors#internal_error'

end
