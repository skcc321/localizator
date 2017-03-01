# encoding: utf-8

module Localizator
  class TransformationError < StandardError; end

  module Transformation
    def flatten_hash(hash, namespace = [], tree = {})
      hash.each do |key, value|
        child_namespace = namespace.dup << key
        if value.is_a?(Hash)
          flatten_hash(value, child_namespace, tree)
        else
          tree[child_namespace.join('.')] = value
        end
      end

      tree
    end

    def nest_hash(hash)
      result = {}

      hash.each do |key, value|
        begin
          sub_result = result
          keys = key.split('.')
          keys.each_with_index do |k, idx|
            if keys.size - 1 == idx
              sub_result[k.to_s] = value
            else
              sub_result = (sub_result[k.to_s] ||= {})
            end
          end
        rescue StandardError
          message = "Failed to nest key: #{key.inspect} with value: #{value.inspect}"
          raise TransformationError, message
        end
      end

      result
    end

    module_function :flatten_hash
    module_function :nest_hash
  end
end
