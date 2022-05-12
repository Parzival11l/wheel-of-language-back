Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://wheel-of-language-back.vercel.app/'
    resource '*',
             headers: :any, methods: [:get, :post, :patch, :delete, :patch, :put],
             expose: ["Authorization"]
  end
end