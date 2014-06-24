class Api::V1::ProductsController < Api::V1::BaseController
  def index
    count = (params[:count] || 1).to_i
    products = []
    count.times do
      products << Product.new
    end

    respond_with(products)
  end
end
