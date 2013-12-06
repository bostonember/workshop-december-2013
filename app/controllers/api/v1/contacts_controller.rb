class Api::V1::ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def show
    render json: Contact.find(params[:id])
  end

  def create
    contact = Contact.new(contact_params)

    contact.save
    render json: contact
  end

  def update
    contact = Contact.find(params[:id])
    contact.update_attributes(contact_params)
    render json: contact
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact, status: 204
  end

  private

  def contact_params
    params.require(:contact).permit!
  end
end
