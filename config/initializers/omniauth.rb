Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.credentials.github[:client_id], Rails.application.credentials.github[:secret_access_key]
  
end