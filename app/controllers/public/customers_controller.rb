class Public::CustomersController < ApplicationController

  def show
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def withdraw
  end

  private
  def customer_params
    params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :phone_number)
  end
end
