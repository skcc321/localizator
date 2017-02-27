require 'localizator/engine'
require 'localizator/rewrite'
require 'localizator/version'
require 'localizator/app'
require 'localizator/category'
require 'localizator/key'
require 'localizator/store'
require 'localizator/transformation'
require 'localizator/translation'
require 'localizator/zip_file_generator'

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

  # If you want to enable access by specific conditions
  mattr_accessor :verify_access_proc
  @@verify_access_proc = proc { |controller| true }

  # If you want to enable access by specific conditions
  mattr_accessor :enable_proc
  @@enable_proc = proc { |controller| controller.try(:current_user).try(:admin?) }

  class << self
    attr_accessor :app

    def setup
      yield(self)

      self.app = App.new(locales_path)
      self.app.start

      ::I18n.send(:include, TranslationEditLink)
      ::ApplicationHelper.send(:include, TranslationEditLink)
      ::ActionController::Base.send(:include, TranslationController)
    end
  end
end
