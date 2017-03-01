# encoding: utf-8

require 'set'

module Localizator
  class Category
    attr_accessor :name, :keys

    def initialize(attributes = {})
      @name = attributes[:name]
      @keys = Set.new
    end

    def add_key(key)
      keys.add(key)
    end

    def complete?
      keys.all?(&:complete?)
    end
  end
end
