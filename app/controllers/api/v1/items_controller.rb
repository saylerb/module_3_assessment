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

  def create
    item = Item.new(item_params)
    if item.save
      respond_with item
    else
      respond_with "Item not saved"
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
