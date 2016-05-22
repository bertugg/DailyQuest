Rails.application.routes.draw do
  devise_for :users
  resources :quests
  root to: "quests#taskpanelshow"
end
