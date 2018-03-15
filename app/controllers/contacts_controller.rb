class ContactsController < ApplicationController
  def index
    response = Contact.all
    render json: response, status: :ok
  end

  def create
    response = Contact.create(create_contact_params)
    render json: response, status: :created
  end

  private
    def create_contact_params
      params.require(:data).permit(:name, :phone, :email, :address)
    end
end
