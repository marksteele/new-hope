require "rubygems"
require 'amqp'
require 'hope/jars/esper-4.5.0.jar'
require 'hope/jars/ning.jar'
require 'hope/jars/commons-logging-1.1.1.jar'
require 'hope/jars/antlr-runtime-3.2.jar'
require 'hope/jars/cglib-nodep-2.2.jar'
require 'hope/jars/log4j-1.2.16.jar'
require "hope/version"
require "hope/pub"
require "hope/engine"
require "hope/config"
require 'json'
require 'snappy'

module Hope
  include Java
  
  def self.amqp_config
    @amqp_config ||= Hope::Config.new("config/amqp.cfg")
  end

  def self.amqp_connection
    @amqp_connection ||= AMQP.connect(amqp_config.amqp)
  end

  def self.amqp_channel
    @amqp_channel ||= AMQP::Channel.new(amqp_connection)
  end

  def self.exchangeout
    @exchangeout ||= amqp_channel.topic(amqp_config.amqp[:exchange_output], :durable => true, :auto_delete => false)
  end

  def self.queue
    @queue ||= amqp_channel.queue("", :exclusive => true, :auto_delete => true).bind(amqp_config.amqp[:exchange_input],:routing_key =>'#')
  end

  def self.compress
    @compress ||= amqp_config.amqp[:compress]
  end
end
