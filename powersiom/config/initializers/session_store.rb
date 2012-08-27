# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_powersiom_session',
  :secret      => '7fa841095ada7a3939ac4c39565c3fdce1b05cff215fdc1ca2a75c21f865264e2bf868bb6b95185821040ff0abe0f5ca717ad66b6036c72dc5d079b90ecc7863'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
