require "proto_config/version"
require "proto_config/prototype"

module ProtoConfig
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def config(config)
      name = "#{self.to_s}Prototype"

      prototype = Object.const_defined?(name) ? Object.const_get(name) : Object.const_set(name, Class.new(Prototype))

      prototype.new(self, config)
    end

    def proto_collaborators(*args)
      args.each do |arg|
        proto_collaborator(arg)
      end
    end

    def proto_collaborator(arg)
      name = name
      class_eval(%Q{
        def #{arg}
          @#{arg} ||= config.fetch(:#{arg}){ #{camelize(arg)} }
        end
      })
    end


  private

    def camelize(string)
      string.sub(/^[a-z\d]*/){ $&.capitalize }.gsub(/(?:_|(\/))([a-z\d]*)/){ $2.capitalize }.gsub('/', '::')
    end
  end


private

  def initialize_prototype(config)
    @config = config
  end

  def config
    @config
  end
end