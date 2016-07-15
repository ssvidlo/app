require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret '74b3d4ac8560eb33b9f7d35266575c8ff13439c229c5434f0de80ffc4d30832e'

  url_format '/media/:job/:name'

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
