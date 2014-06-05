class Api::V1::BaseController < ApplicationController

  respond_to :xml, :json

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  
  private
  
  def authenticate_user_from_token!
    user_uuid  = params[:uuid].presence
    user       = user_uuid && User.where(uuid: user_uuid).first
 
    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
      sign_in user, store: false
    end
  end

end
