Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_apps, domain: 'hooroo.com'
end