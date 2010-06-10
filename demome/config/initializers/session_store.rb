# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_demome_session',
  :secret      => '9ad22ac2a532da432927a948e3a41d7140c8bf1c3070fd6aaeb078c33dd8633f4c6f12eea8501213978a49ebec9e6b6664e09801f575e9ba32d292826d7d61ca'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
