require 'ice_age/version'
require 'set'

class IceAge
  class << self

    def freeze
      raise 'already frozen' if frozen?

      @env = ENV.to_h.freeze
    end

    def frozen?
      !!@env
    end

    def restore
      raise 'not frozen' unless frozen?

      ENV.clear.update(@env)
    end

    def endure!
      raise 'not frozen' unless frozen?

      changes = (Set.new(ENV.to_h) - Set.new(@env)).to_h.keys
      unless changes.empty?
        msg = changes.map {|k| { k => { @env[k] => ENV[k] } }}.to_s
        raise 'ENV changed after freeze: ' + msg
      end
    end

  end
end

# load framework plugins
begin
  require_relative 'ice_age/rspec'
rescue LoadError; end
