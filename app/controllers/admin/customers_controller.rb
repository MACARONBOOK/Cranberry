class Admin::CustomersController < ApplicationController

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :email, :phone_number, :is_deleted )
  end
end
