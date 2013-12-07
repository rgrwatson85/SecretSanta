SecretSanta::Application.routes.draw do
  devise_for :people, :skip => [:sessions]

  as :person do
    get 'login' => 'devise/sessions#new', :as => :new_person_session
    post 'login' => 'devise/sessions#create', :as => :person_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_person_session
  end

  get 'profile/:id', to: 'people#show'
  resources :people, only: [:show, :assign_partners]
  get 'assign', to: 'people#assign_partners'

  root 'home#index'

end
