Rails.application.routes.draw do
  root "redes#index"
  resources :redes do
    resources :registros
  end

  # Escrever por GET
  get "redes/:rede_id/registros/:id/:valor" => "registros#update_simplificado", :constraints => { :valor => /[^\/]+/ }

  # Modo resumido
  get "t/:rede_id/r/:id/:valor" => "registros#update_simplificado", :constraints => { :valor => /[^\/]+/ }
  get "t/:rede_id/r/:id" => "registros#show"
end
