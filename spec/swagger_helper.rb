require 'rspec/rails/swagger'
require 'rails_helper'

RSpec.configure do |config|
  # Specify a root directory where the generated Swagger files will be saved.
  config.swagger_root = Rails.root.to_s + '/swagger'

  # Define one or more Swagger documents and global metadata for each.
  config.swagger_docs = {
    'v1/swagger.json' => {
      swagger: '2.0',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      definitions: {
        contact: {
          type: :object,
          properties: {
            data: {
              type: :object,
              required: %i[name phone email address],
              properties: {
                name: { type: :string, example: 'magmaLabs.io' },
                phone: { type: :string, example: '+52 1 667 317 9035' },
                email: { type: :string, example: 'hello@magmalabs.io' },
                address: { type: :string, example: 'Av. Constitución #2035. Colima, Colima, MX, 28017' }
              }
            }
          }
        }
      }
    }
  }
end
