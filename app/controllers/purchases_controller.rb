class PurchasesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @amount = params[:amount]

    #Creates a Stripe Customer object, for associating with the purchase
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    #Where the real magic happens
    purchase = Stripe::Charge.create(
      customer: customer.id, #Note -- this is NOT the user_id in your app
      amount: @amount,
      description: "Premium Memberhsip - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Thanks for your payment, #{current_user.email}!"


    redirect_to root_path
    
    #Stripe will send back CardErrors, with friendly messages
    #when somethin goes wrong.
    #This 'rescue block' catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_purchase_path
  end

  def new
    #Because large hashes in haml are no fun

    @stripe_btn_hash = {
      src: "https://checkout.stripe.com/checkout.js", 
      class: 'stripe-button',
      data: {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Premium Membership - #{current_user.email}",
        amount: 100
        # We're like the Snapchat for Wikipedia. But really, 
        # change this amount. Stripe won't charge $9 billion.
      }
    }
  end
end
