class Api::V1::ItemsController < ApiController
  respond_to :JSON

  def index
    respond_with Item.all
  end
end
