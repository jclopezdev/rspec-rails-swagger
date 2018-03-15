class ContactsController < ApplicationController
  def index
    response = Contact.all

    render json: response, status: :ok
  end
end
