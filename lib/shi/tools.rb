# frozen_string_literal: true

require_relative 'tools/version'

module Shi::Tools
  def coalesce *args
    args.each do |arg|
      return arg unless arg.nil?
    end
    nil
  end

  def lookup_with source, name, prefixes
    prefixes.each do |prefix|
      name_with_prefix = if prefix == :base
          name
        else
          prefix.to_s + '.' + name
        end
      value = source[name_with_prefix]
      return value unless value.nil?
    end
    nil
  end

  module_function :coalesce, :lookup_with
end
