class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :index]

  def index
  end

  def show
  end
end
