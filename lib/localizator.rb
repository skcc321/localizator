require "localizator/engine"
require "localizator/rewrite"
require "localizator/version"
require "localizator/app"
require "localizator/category"
require "localizator/key"
require "localizator/store"
require "localizator/transformation"
require "localizator/translation"

module Localizator
  mattr_accessor :locales_path
  @@locales_path = '.'

  mattr_accessor :enable_links
  @@enable_links = false

  mattr_accessor :edit_link_caption
  @@edit_link_caption = '&#9998;'

  mattr_accessor :username
  @@username = false

  mattr_accessor :password
  @@password = false

  class << self
    attr_accessor :app

    def setup
      yield(self)

      self.app = App.new(locales_path)
      self.app.start

      ::I18n.send(:include, TranslationEditLink)
      ::ApplicationHelper.send(:include, TranslationEditLink)
    end
  end
end
