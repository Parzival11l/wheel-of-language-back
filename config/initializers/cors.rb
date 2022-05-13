Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://wheel-of-language.vercel.app', 'http://363c-80-72-24-188.ngrok.io'
    resource '*',
             headers: :any, methods: [:get, :post, :patch, :delete, :patch, :put, :options],
             expose: ["Authorization"]
  end
end