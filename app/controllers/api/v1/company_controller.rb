class Api::V1::CompanyController < Api::V1::BaseController
  def index
    count = (params[:count] || 1).to_i
    company = []
    count.times do
      company << Company.new
    end

    respond_with(company)
  end
end
