require 'set'

class IceAge
  VERSION = '0.0.1'

  class << self

    def freeze
      raise 'already frozen' if frozen?

      @env = ENV.to_h.freeze
    end

    def frozen?
      !!@env
    end

    def restore
      raise "#{self.class.name}.frozen never called!" unless frozen?

      ENV.clear.update(@env)
    end

    def endure!
      changes = (Set.new(ENV.to_h) - Set.new(@env)).to_h.keys
      unless changes.empty?
        raise 'ENV changed after freeze: ' + changes.to_s
      end
    end

  end
end


# load framework plugins
begin
  require_relative 'ice_age/rspec'
rescue LoadError; end
