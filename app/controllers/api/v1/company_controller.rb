class Api::V1::CompanyController < Api::V1::BaseController
  def index
    count = (params[:count] || 1).to_i
    has_product = params[:with_product].present?
    company = []
    count.times do
      company << Company.new(has_product)
    end

    respond_with(company)
  end
end
