class DashboardController < PurchasesController
  def index
    @amount = params[:amount]
  end
end

