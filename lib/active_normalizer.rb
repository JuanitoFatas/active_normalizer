# frozen_string_literal: true

require "active_normalizer/version"
require "active_normalizer/normalizers/normalizer"

class ActiveNormalizer
  MissingDependencyError = Class.new(RuntimeError)

  def self.require_dependency(name, klass)
    require name
  rescue LoadError => exception
    raise MissingDependencyError,
          %(Missing dependency '#{name}' for #{klass}. See README.md for details.\n#{exception.class.name}: #{exception})
  end

  def initialize(normalizer_klass, options: nil)
    @normalizer = normalizer_klass.new(options)
  end

  def run(text)
    normalizer.run(text)
  end

  private

  attr_reader :normalizer
end
