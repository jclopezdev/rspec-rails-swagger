class Contact < ApplicationRecord
  validates :name, :phone, presence: true
end
