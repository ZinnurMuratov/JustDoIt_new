# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'



  config.http_authenticatable_on_xhr = false

  config.navigational_formats = ['*/*', :html, :json]

  require 'devise/orm/active_record'


  config.case_insensitive_keys = [:email]
  config.reset_password_keys = [ :username ]
  config.confirmation_keys = [ :username ]


  config.secret_key = 'dbc8e39c66837017a717b8587f5e4139de6136c6fbd13e42197d8667d2663221f10ff579685ab32406f6254a68173c2f60a7cc40c4300ece16a0deeaf9a4cb52'
  config.stretches = Rails.env.test? ? 1 : 11


  config.reconfirmable = true


  config.expire_all_remember_me_on_sign_out = true


  config.password_length = 6..128


  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours


  config.sign_out_via = :delete


end
