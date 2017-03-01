# encoding: utf-8

require "psych"
require "yaml"

require "localizator/store"

module Localizator
  class App
    attr_accessor :store
    attr_reader :path, :stor

    def initialize(path)
      @path = File.expand_path(path)
      @store = Store.new
    end

    def start
      load_translations
      store.create_missing_keys
    end

    def load_translations
      files = Dir[path + "/**/*.yml"]

      files.each do |file|
        yaml = YAML.load_file(file)
        store.from_yaml(yaml, file)
      end
    end

    def save_translations
      files = store.to_yaml
      files.each do |file, yaml|
        File.open(file, "w", encoding: "utf-8") {|f| f << yaml.to_yaml(line_width: -1)}
      end
    end
  end
end
