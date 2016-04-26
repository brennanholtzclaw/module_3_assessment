class Api::V1::ItemsController < ApiController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    respond_with Item.destroy(params[:id])
  end

  def create
    binding.pry
    respond_with Item.create_by(params)
  end
end
