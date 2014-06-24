class Api::V1::PetsController < Api::V1::BaseController
  def index
    count = (params[:count] || 1).to_i
    pet = []
    count.times do
      pet << Pet.new
    end

    respond_with(product)
  end
end
