Rails.application.routes.draw do
  root 'contacts#index'

  scope '(:locale)' do
    resources :contacts
    resources :phones, only: [:edit, :update, :destroy]
  end
end
