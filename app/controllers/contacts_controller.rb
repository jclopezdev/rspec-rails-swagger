class ContactsController < ApplicationController
  before_action :find_contact, only: [:show]

  def index
    response = Contact.all
    render json: response, status: :ok
  end

  def create
    response = Contact.create(create_contact_params)
    render json: response, status: :created
  end

  def show
    render json: @contact, status: :ok
  end

  private
    def create_contact_params
      params.require(:data).permit(:name, :phone, :email, :address)
    end

    def find_contact
      @contact = Contact.where(id: params[:id]).first
      render :nothing, status: :not_found unless @contact
    end
end
