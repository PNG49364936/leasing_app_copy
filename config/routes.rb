# frozen_string_literal: true

Rails.application.routes.draw do
  # Page d'accueil
  root 'demandes#index'

  # Routes pour les demandes (CRUD complet)
  resources :demandes do
    # Routes imbriquées pour les sous-ressources
    resources :bloc_plan_financements, only: %i[create update destroy]
    resources :bloc_materiels, only: %i[create update destroy]
    resources :bloc_dirigeants, only: %i[create update destroy]
  end

  resources :demandes do
    member do
      post :submit_to_api  # Crée une route /demandes/:id/submit_to_api
    end
  end
end
