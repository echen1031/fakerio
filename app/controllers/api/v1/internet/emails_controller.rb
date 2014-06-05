class Api::V1::Internet::EmailsController < Api::V1::BaseController

  # GET /api/v1/internet/emails.json
  # GET /api/v1/internet/emails.xml
  def index
    count = (params[:count] || 1).to_i
    emails_addresses = []
    count.times do
      emails_addresses << Faker::Internet.email
    end

    respond_with(emails_addresses)
  end
end
