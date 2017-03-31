Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'application#index'

  get 'o_firmie' => 'application#company_info'
  get 'oferta' => 'application#services'
  get 'kalkulator' => 'calculators#new'
  get 'do_pobrania' => 'application#download'
  get 'kontakt' => 'application#contact'


  # get 'contact' => 'contacts#new'
  match '/contact',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

  # match '/kalkulator',     to: 'calculator#new',             via: 'get'
  resources "calculators", only: [:new, :create]
end
