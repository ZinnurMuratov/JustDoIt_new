# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'


  config.http_authenticatable = false
  config.skip_session_storage = [:http_auth]

  config.http_authenticatable_on_xhr = false
  config.navigational_formats = [:html, :json]

  require 'devise/orm/active_record'


  config.case_insensitive_keys = [:email]




  config.stretches = Rails.env.test? ? 1 : 11


  config.reconfirmable = true


  config.expire_all_remember_me_on_sign_out = true


  config.password_length = 6..128


  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours


  config.sign_out_via = :delete


end