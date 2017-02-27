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
            <i class='edit-locale-link'
               data-href='/localizator?filters[key]=#{attrs.first}'
            >
               #{Localizator.edit_link_caption}
            </i>
            eos

            "#{result}#{link}".html_safe
          end
        end
      end
    end
  end
end
