# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :notes, only: %i[create destroy show], param: :slug

      get '/notes/:slug/password/:password' => 'notes#show'
    end
  end
end
