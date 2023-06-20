GrapeSwaggerRails.options.app_url  = Rails.application.secrets.api_url
GrapeSwaggerRails.options.url      = '/v1/swagger_doc.json'
GrapeSwaggerRails.options.app_name = 'HaulHQ API Documentation'
GrapeSwaggerRails.options.debug = true

# GrapeSwaggerRails.options.api_auth     = 'basic' # Or 'bearer' for OAuth
GrapeSwaggerRails.options.api_key_name = 'X-Auth-Token'
GrapeSwaggerRails.options.api_key_type = 'header'
GrapeSwaggerRails.options.headers['X-App-Key'] = 'Some Secret Value'
