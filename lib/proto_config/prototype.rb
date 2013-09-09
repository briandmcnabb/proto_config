class Prototype
  def initialize(base, *args, &block)
    @prototype = begin
      prototype = base.send(:allocate)
      prototype.send(:initialize_prototype, *args, &block)
      prototype
    end
  end

  def new(*args, &block)
    instance = @prototype.dup
    instance.send(:initialize, *args, &block)
    instance
  end
end