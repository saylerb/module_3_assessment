class Api::V1::ItemsController < Api::V1::ApiBaseController
  def index
    respond_with Item.all
  end
end
