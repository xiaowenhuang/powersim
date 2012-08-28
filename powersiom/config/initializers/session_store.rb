# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_powersiom_session',
  :secret      => '872c7e61793902eb3472928fbf17739cbf4a1f03ff8c868f1e2b31b175dd9b26a64a2f20bd270565ad636c25310cc1f75ab2c0c84586f65caaf1ddc0fa88313d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
