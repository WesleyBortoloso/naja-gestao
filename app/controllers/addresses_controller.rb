class AddressesController < ApplicationController
  layout 'application'

  before_action :authenticate_user!
  before_action :municipe

  def new
    @address = municipe.addresses.new
  end

  def create
    address = municipe.addresses.create(address_params)
    if address.save
      redirect_to municipes_path
    else
      flash[:notice] = address.errors.errors
      render :new, status: :unprocessable_entity
    end
  end

  private

  def municipe
    Municipe.find(params[:municipe_id])
  end

  def address_params
    params.require(:address)
          .permit(:zip_code, :street, :neighborhood, :city, :state, :ibge_code, :complement)
  end
end
