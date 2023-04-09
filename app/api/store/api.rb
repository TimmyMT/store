module Store
  class Api < Grape::API
    format :json
    prefix :api
    version 'v1'

    mount Store::V1::Items
    mount Store::V1::Health
  end
end
