# encoding: utf-8

require_relative 'tools/version'

module Shi::Tools
  def lookup source, name, delimiter = '.'
    return nil if name.nil?
    lookup = source
    name.split(delimiter).each do |value|
      lookup = lookup[value]
      break if lookup.nil?
    end
    lookup
  end

  def coalesce *args
    args.each do |arg|
      return arg unless arg.nil?
    end
    nil
  end

  def lookup_with source, name, *prefixes
    prefixes.each do |prefix|
      name_with_prefix = if prefix == :base
          name
        else
          prefix.to_s + '.' + name
        end
      value = lookup source, name_with_prefix
      return value unless value.nil?
    end
    nil
  end

  module_function :lookup, :coalesce, :lookup_with
end
