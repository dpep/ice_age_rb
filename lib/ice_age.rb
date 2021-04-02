require 'ice_age/version'
require 'set'

module IceAge
  extend self

  def freeze
    raise 'already frozen' if frozen?

    @env = ENV.to_h.freeze
  end

  def frozen?
    !!@env
  end

  def restore
    raise 'not frozen' unless frozen?

    ENV.replace(@env)
  end

  def endure!
    raise 'not frozen' unless frozen?

    changes = (Set.new(ENV.to_h) - Set.new(@env)).to_h.keys - WHITELIST
    unless changes.empty?
      msg = changes.map {|k| { k => { @env[k] => ENV[k] } }}.to_s
      raise 'ENV changed after freeze: ' + msg
    end
  end

  WHITELIST = [
    'LINES',
    'COLUMNS',
  ].freeze
  private_constant :WHITELIST
end

# load framework plugins
begin
  require_relative 'ice_age/rspec'
rescue LoadError; end
