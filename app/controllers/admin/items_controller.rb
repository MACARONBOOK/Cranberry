class Admin::ItemsController < ApplicationController

  def new
  end

  def create
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :sales_status, :image)
  end
end
