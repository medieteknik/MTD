Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # set default mail url
  config.action_mailer.default_url_options = { host: 'localhost', port: 5000 }

  # use letter opener for mail while in develop env
  config.action_mailer.delivery_method = :letter_opener

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # disable Rack::Lock middleware to get websocket-rails working
  config.middleware.delete Rack::Lock

  # setup byebyg remote as this guide suggests:
  # https://github.com/deivid-rodriguez/byebug/blob/7c8c0db25f3efe5878477449c5b9e070b41beabe/GUIDE.md#debugging-remote-programs
  # require 'byebug'
  # Byebug.wait_connection = true
  # Byebug.start_server('localhost', 10001)
end
