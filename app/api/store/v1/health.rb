module Store
  module V1
    class Health < Store::Api
      resources :health do
        get do
          status :ok
        end
      end
    end
  end
end
