class Public::OrdersController < ApplicationController

  def new
  end

  def index
  end

  def show
  end

  def create
  end

  def confirm
  end

  def thanks
  end

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_price, :shipping_cost)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code, :customer_id)
  end
end
