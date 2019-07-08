Rails.application.routes.draw do
  devise_for :users
	

	resources :chat_rooms
	resources :messages
	root 'chat_rooms#index'

	mount ActionCable.server => '/cable'
end
