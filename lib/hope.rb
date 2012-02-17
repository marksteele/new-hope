require 'json'

require 'em-zeromq'

require 'hope/jars/esper-4.5.0.jar'
require 'hope/jars/commons-logging-1.1.1.jar'
require 'hope/jars/antlr-runtime-3.2.jar'
require 'hope/jars/cglib-nodep-2.2.jar'
require 'hope/jars/log4j-1.2.16.jar'

require "hope/version"
require "hope/pub"
require "hope/engine"

module Hope
  include Java
  
  def self.ctx
    @ctx ||= EM::ZeroMQ::Context.new(1)
  end
  
  def self.pub
    @pub ||= ctx.bind ZMQ::PUB, 'ipc://hope'
  end
  
end