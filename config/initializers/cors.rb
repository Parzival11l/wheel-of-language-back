Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://wheel-of-language.vercel.app'
    resource '*',
             headers: :any, methods: [:get, :post, :patch, :delete, :patch, :put, :options],
             expose: ["Authorization"]
  end
end