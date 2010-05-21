# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_demome_session',
  :secret      => 'c8749d4c5921a42de391b2458d9e6648c2935a4f5e8b91ac52095664188d2cbc51ebfaa1256c9f9e0d5a7019118836ae6607bffacd0482069096e9dc4f1662f8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
