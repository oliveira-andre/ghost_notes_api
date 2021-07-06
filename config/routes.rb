# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notes, only: %i[create destroy], param: :slug do
    get :password
  end
end
