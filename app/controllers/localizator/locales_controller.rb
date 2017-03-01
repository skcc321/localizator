require_dependency "localizator/application_controller"

require "localizator/app"

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
      translations = params[:translations]

      if translations.present?
        translations.each {|name, text|
          app.store.translations[name].text = text
        }
        app.save_translations
      end

      redirect_to locales_path(filters: params[:filters])
    end

    def download
      input_dir = Localizator.locales_path
      output_file = Tempfile.new(['locales', '.zip'])
      output_file.close
      ZipFileGenerator.new(input_dir, output_file.path).write

      send_file output_file.path
    end

    def reload
      FileUtils.touch(Rails.root.join('tmp', 'restart.txt'))
      redirect_to locales_path
    end
  end
end
