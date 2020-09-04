require 'set'

class IceAge
  VERSION = '0.0.0'

  class << self
    def restore
      raise "#{self.class.name}.frozen never called!" unless @env

      ENV.clear.update(@env)
    end

    def changes
      (Set.new(ENV.to_h) - Set.new(@env)).to_h.keys
    end

    def endure!
      unless changes.empty?
        raise 'ENV changed during test setup: ' + changes.to_s
      end
    end

    def freeze
      raise 'already frozen' if @env

      @env = ENV.to_h.freeze
    end
  end
end

IceAge.freeze

if defined? RSpec
  require_relative 'ice_age/rspec'
end
