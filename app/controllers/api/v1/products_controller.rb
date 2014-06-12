class Api::V1::ProductsController < Api::V1::BaseController
  def index
    count = (params[:count] || 1).to_i
    product = []
    count.times do
      product << Product.new
    end

    respond_with(product)
  end
end
