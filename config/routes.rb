Rails.application.routes.draw do
  post 'item', to: 'items#create'
end
