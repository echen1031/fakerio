class Api::V1::Internet::IpAddressesController < Api::V1::BaseController
  def index
    count = (params[:count] || 1).to_i
    ip_addresses_controller = []
    count.times do
      ip_addresses_controller << Faker::Internet.ip_v4_address
    end

    respond_with(ip_addresses_controller)
  end
end
