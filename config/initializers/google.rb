GOOGLE_AUTH = YAML.load(File.read("config/google_auth.yml")) rescue Hash.new

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, (GOOGLE_AUTH[:key] or ENV["GOOGLE_KEY"]), (GOOGLE_AUTH[:secret] or ENV["GOOGLE_SECRET"])
end
