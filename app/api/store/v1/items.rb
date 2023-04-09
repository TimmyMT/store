module Store
  module V1
    class Items < Store::Api
      formatter :json, Grape::Formatter::ActiveModelSerializers

      resources :items do
        get '/:id' do
          item = Item.find(params[:id])

          status :ok
          item
        end

        get '/' do
          Item.all
        end

        post '/' do
          item = Item.new(params[:item])

          if item.save
            status :created
            item
          else
            status :bad_request
            { error: item.errors.full_messages }
          end
        end

        patch '/:id' do
          item = Item.find(params[:id])

          if item.update(params[:item]) && !params[:item].blank?
            status :ok
            item
          else
            status :bad_request
            { error: item.errors.full_messages }
          end
        end

        delete '/:id' do
          item = Item.find(params[:id])

          item.destroy
          status :no_content
        end
      end
    end
  end
end
