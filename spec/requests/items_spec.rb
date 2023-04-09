require 'swagger_helper'

describe 'items API' do
  path '/api/v1/items' do
    get 'returns current condition' do
      tags 'Items'
      produces 'application/json'

      response '200', "Return items list" do
        schema '$ref' => '#/components/schemas/items_array'

        let!(:items) { create_list :item, 3 }

        run_test! do
          expect(JSON.parse(response.body).pluck('id')).to eq(items.pluck(:id))
        end
      end
    end
  end

  path '/api/v1/items' do
    post 'creates new item' do
      tags 'Items'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :params,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    item: {
                      type: :object,
                      properties: {
                        name: { type: :string },
                        description: { type: :string }
                      },
                      required: %w[name description]
                    }
                  },
                  required: %w[item]
                }

      response '201', "Return created item" do
        schema '$ref' => '#/components/schemas/item'

        let(:params) { { item: { name: 'Kek', description: 'Lol' } } }

        run_test! do
          expect(Item.count).to eq(1)
          expect(JSON.parse(response.body)['name']).to eq('Kek')
        end
      end

      response '400', "Not creates new item" do
        let(:params) { { item: {} } }

        run_test! do
          expect(Item.count).to eq(0)
          expect(JSON.parse(response.body)['error']).to eq(["Name can't be blank"])
        end
      end
    end
  end

  path '/api/v1/items/{id}' do
    patch 'Updates item' do
      tags 'Items'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id,
                in: :path,
                type: :string

      parameter name: :params,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    item: {
                      type: :object,
                      properties: {
                        name: { type: :string },
                        description: { type: :string }
                      },
                      required: %w[name description]
                    }
                  },
                  required: %w[item]
                }

      response '200', "Updates item" do
        schema '$ref' => '#/components/schemas/item'

        let(:item) { create :item }
        let(:id) { item.id }
        let(:params) { { item: { name: 'Рубашка', description: 'В клеточку' } } }

        run_test! do
          expect(item.reload.name).to eq('Рубашка')
          expect(item.reload.description).to eq('В клеточку')
        end
      end

      response '400', "Not updates item" do
        let(:item) { create :item }
        let(:id) { item.id }
        let(:params) { { item: {} } }

        run_test! do
          expect(item.reload.name).not_to eq('Рубашка')
          expect(item.reload.description).not_to eq('В клеточку')
        end
      end
    end
  end

  path '/api/v1/items/{id}' do
    delete 'Deletes item' do
      tags 'Items'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id,
                in: :path,
                type: :string

      response '204', "Deletes item" do
        let(:item) { create :item }
        let(:id) { item.id }

        run_test! do
          expect(Item.count).to eq(0)
        end
      end
    end
  end

  path '/api/v1/items/{id}' do
    get 'Fetch item' do
      tags 'Items'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :id,
                in: :path,
                type: :string

      response '200', "Fetch item" do
        schema '$ref' => '#/components/schemas/item'

        let(:item) { create :item }
        let(:id) { item.id }

        run_test! do
          expect(JSON.parse(response.body)['id']).to eq(item.id)
        end
      end
    end
  end
end
