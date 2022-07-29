class Public::DeliveryAddressesController < ApplicationController

  def index
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code, :address, :name)
  end
end
