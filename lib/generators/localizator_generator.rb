class LocalizatorGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  desc 'This generator creates an localizator config at config/initializers'
  def copy_initializer
    template 'localizator.rb', 'config/initializers/localizator.rb'
  end
end
