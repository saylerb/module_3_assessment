class SearchController < ApplicationController
  def index
    @stores, @total_stores = StoreSearch.all(search_params[:query])
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end
end
