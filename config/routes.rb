Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # accounts registrations
  scope 'account' do
    get   'new' =>  'accounts/registrations#new',     as: :accounts_new
    post  ''    =>  'accounts/registrations#create',  as: :accounts_create
  end
end
