class PhonesController < ApplicationController
  before_action :set_phone, only: [:edit, :update, :destroy]

  def edit; end

  def update
    if @phone.update_attributes(phone_params)
      redirect_to @phone.contact
    else
      render :edit
    end
  end

  def destroy
    contact = @phone.contact
    @phone.destroy
    redirect_to contact
  end

  private

  def set_phone
    @phone = Phone.find(params[:id])
  end

  def phone_params
    params.require(:phone).permit(:number)
  end
end
