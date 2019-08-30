# Be sure to restart your server when you modify this file.

#Refinerycms::Application.config.session_store :cookie_store, :key => '_novasol_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
Refinerycms::Application.config.session_store :redis_store,
	servers: ["#{Rails.configuration.database_configuration[Rails.env]["redis"]}/session"],
	expire_after: 7.days,
	key: "_Scorpio_session",
	threadsafe: false
