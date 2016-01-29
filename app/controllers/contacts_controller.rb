class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :edit]

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
    @contact.build_address
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact
    else
      render :new
    end
  end

  def update
    if @contact.update_attributes(contact_params)
      redirect_to @contact
    else
      render :edit
    end
  end

  private
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :last_name, :bio, address_attributes: [
      :address1, :address2, :city, :state, :country, :zip_code
    ])
  end
end
