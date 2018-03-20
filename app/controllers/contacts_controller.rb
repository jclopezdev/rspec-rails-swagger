class ContactsController < ApplicationController
  before_action :find_contact, only: %I[show update]

  def index
    response = Contact.all
    render json: response, status: :ok
  end

  def create
    response = Contact.create(contact_params)
    render json: response, status: :created
  end

  def show
    render json: @contact, status: :ok
  end

  def update
    response = @contact.update(contact_params)
    render :nothing, status: :ok
  end

  private
    def contact_params
      params.require(:data).permit(:name, :phone, :email, :address)
    end

    def find_contact
      @contact = Contact.where(id: params[:id]).first
      render :nothing, status: :not_found unless @contact
    end
end
