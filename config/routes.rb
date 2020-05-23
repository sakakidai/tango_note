Rails.application.routes.draw do
  root 'word_books#index'
  resources :word_books

  devise_for :users,
  controllers: { omniauth_callbacks: "omniauth_callbacks" },
  path: '/',
  path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
