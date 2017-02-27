module ActionDispatch::Routing
  class Mapper
    def mount_localizator_routes(options = {})
      mount Localizator::Engine => '/localizator', as: (options[:as] || 'localizator')
    end
  end
end


module Localizator
  module TranslationController
    def self.included base
      base.instance_eval do
        before_action :enable_localizator
      end
    end

    def enable_localizator
      #return false unless Localizator.enabled

      ::Localizator.enable_links = Localizator.enable_proc.call(self)
    end
  end
end


module Localizator
  module TranslationEditLink
    def self.included base
      base.instance_eval do
        def self.translate(*attrs)
          result = super(*attrs)

          if !::Localizator.enable_links || result.is_a?(Hash)
            result
          else
            link = <<-eos
            <a href='/localizator?filters[key]=#{attrs.first}'">
               #{Localizator.edit_link_caption}
            </a>
            eos

            "#{result}#{link}".html_safe
          end
        end
      end
    end
  end
end
