Rails.application.routes.draw do
  root 'contacts#index'

  scope '(:locale)' do
    resources 'contacts'
  end
end
