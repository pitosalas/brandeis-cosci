# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ajaxtest_session',
  :secret      => 'dca6e577a8b4e052502111d2c16d0301cee8e6a7f7716229c43ebb7b1008076bfc26eaa77eeac671463a660f9613839846388e8f411062dfd1d045b14117c5fa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
