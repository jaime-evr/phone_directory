Rails.application.routes.draw do
  root 'contacts#index'

  scope '(:locale)', locale: /en|es/, defaults: { locale: 'en' } do
    resources 'contacts'
  end
end
