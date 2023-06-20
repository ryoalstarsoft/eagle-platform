rails.application.configure do
  # Automatically inject JavaScript needed for LiveReload
  config.middleware.insert_after(ActionDispatch::Static, Rack::LiveReload)
end