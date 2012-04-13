module Hope
  class Config
    attr_reader :amqp
    public
    def initialize(cfg_file="config/amqp.cfg")
      @amqp = {}
      instance_eval(File.read(cfg_file))
    end # def initialize
    public
    def amqp_settings(params)
      required = [:host,:port, :user, :pass, :vhost, :exchange_input, :exchange_output]
      if not verify_present(params, required)
        raise "required parameters (#{required.inspect}) missing from statement: #{params.inspect}"
      end
      @amqp = params
    end # def amqp_settings
    private
    def verify_present(params, required)
      required.each do |key|
        return false unless params.member?(key)
      end
      return true
    end # def verify_present
  end
end
