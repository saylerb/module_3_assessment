class Api::V1::ItemsController < Api::V1::ApiBaseController
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end
  
  def destroy
    respond_with Item.find(params[:id]).destroy
  end
end
