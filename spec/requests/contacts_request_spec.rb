require 'swagger_helper'

RSpec.describe 'Contacts', type: :request, capture_examples: true do
  path '/contacts' do
    get(summary: 'Get contacts') do
      consumes 'application/json'
      produces 'application/json'
      tags :contacts

      let!(:contacts) do
        3.times do
          create(:contact)
        end
      end

      response(200, description: 'Return all the available contacts') do
        it 'Return 3 contacts' do
          body = JSON(response.body)
          expect(body.count).to eq(3)
        end
      end
    end

    post(summary: 'Create a new contact') do
      consumes 'application/json'
      produces 'application/json'
      tags :contacts

      parameter :data,
                in: :body,
                required: true,
                schema: {
                  '$ref' => '#/definitions/createContact'
                }

      response(201, description: 'Contact created') do
        let(:data) do
          {
            data: {
              name: 'Magmalabs.io',
              phone: '+52 1 667 317 9035',
              email: 'hello@magmalabs.io',
              address: 'Av. Constitución #2035. Colima, Colima, MX, 28017'
            }
          }
        end
      end
    end
  end
end
