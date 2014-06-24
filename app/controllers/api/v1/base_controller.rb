class Api::V1::BaseController < ApplicationController

  respond_to :xml, :json

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  
  around_filter :protect_api_methods

  def protect_api_methods
    if current_user.credits <= 0
      respond_with({error: "You are out of credits, please purchase more."}, status: :payment_required)
    else
      yield
      current_user.credits_in_cents -= 1
      current_user.save
      response.headers["X-FAKER-IO-CREDITS-REMAINING"] = current_user.credits_in_cents.to_s
    end
  end

  private
  
  def authenticate_user_from_token!
    user_uuid  = params[:uuid].presence
    #user       = user_uuid && User.where(uuid: user_uuid).first

    user = User.find_by_uuid(user_uuid) # if the uuid is not there, user will be nil

 
    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
      sign_in user, store: false
    end
  end

end
