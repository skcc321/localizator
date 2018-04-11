Localizator.setup do |config|
  config.locales_path = Rails.root.join('config', 'locales')

  # config.edit_link_caption = '&#9998;'

  # config.username = false;
  # config.password = false;

  config.enable_proc  = proc { |controller| Rails.env.development? }

  config.disable_pattern = [
    /\Aseo\./
  ]
end
