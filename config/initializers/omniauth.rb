Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.credentials.dig(:github, :cliend_id), Rails.application.credentials.dig(:github, :secret_access_key) 
  
end