Localizator.setup do |config|
  config.locales_path = Rails.root.join('config', 'locales')
  config.enable_proc  = proc { |controller| true }
end
