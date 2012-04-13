require 'json'

require "rubygems"
require 'amqp'

require 'hope/jars/esper-4.5.0.jar'
require 'hope/jars/commons-logging-1.1.1.jar'
require 'hope/jars/antlr-runtime-3.2.jar'
require 'hope/jars/cglib-nodep-2.2.jar'
require 'hope/jars/log4j-1.2.16.jar'

require "hope/version"
require "hope/pub"
require "hope/engine"
require "hope/config"

module Hope
  include Java
  
  def self.ctx
    @amqp_config = Hope::Config.new("config/amqp.cfg")
    connection = AMQP.connect(@amqp_config.amqp)
    @ctx ||= AMQP::Channel.new(connection)
  end

  def self.exchangeout
    @amqp_config = Hope::Config.new("config/amqp.cfg")
    @exchangeout ||= ctx.topic(@amqp_config.amqp[:exchange_output])
  end

  def self.exchangein
    @amqp_config = Hope::Config.new("config/amqp.cfg")
    @exchangein ||= ctx.topic(@amqp_config.amqp[:exchange_input])
  end

end
