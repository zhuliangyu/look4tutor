Rails.configuration.stripe = {
    publishable_key: 'pk_test_TSFX8V7dFPSewrtMIKKeQEOu',
    secret_key: 'sk_test_22EipshOZW1DniueIhUZGeEu'
}

# Stripe.api_key = Rails.application.secrets.stripe_secret_key
Stripe.api_key = Rails.configuration.stripe[:secret_key]
