require_dependency "localizator/application_controller"

require "localizator/app"
require "pry"

module Localizator
  class LocalesController < ApplicationController
    def index
      @filters = params[:filters]

      if @filters.present?
        options = {}
        options[:key] = /#{@filters["key"]}/ if @filters["key"].to_s.size > 0
        options[:text] = /#{@filters["text"]}/i if @filters["text"].to_s.size > 0
        options[:complete] = false if @filters["incomplete"] == "on"
        options[:empty] = true if @filters["empty"] == "on"

        @keys = app.store.filter_keys(options)
      else
        @filters = {}
        @categories = app.store.categories.sort
      end
    end

    def update
      if translations = params[:translations]
        translations.each {|name, text|
          app.store.translations[name].text = text
        }
        app.save_translations
      end

      redirect_to locales_path(filters: params[:filters])
    end
  end
end
