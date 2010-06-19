# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_assoc_session',
  :secret      => 'db5851f64c19e04c95f73da0ba41d3d0484b77c521e6d3b93f7afdec8ac1acc5446f495ffa04c9b01e49762380a908b01bcd8106da4ef393b1dba92cd64bba14'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
