Rails.application.routes.draw do
  # get 'auctions/index'

  # get 'auctions/show'
  root 'auctions#import'

  resources :auctions do
    collection { post :import }
  end

end
