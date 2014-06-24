# Store the environment variables on the Rails.configuration object
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_nqmHCw1SfH53pcDIo8o4CZXs',
  :secret_key      => 'sk_test_9BSKUfvoFChrKCCqczB0bxRG'
}

# Set our app-stored secret key with Stripe
Stripe.api_key = Rails.configuration.stripe[:secret_key]
