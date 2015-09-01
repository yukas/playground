module A
  class B
    class << self
      puts Module.nesting.inspect
    end
  end
end

Module.new do
  Class.new do
    puts Module.nesting.inspect
  end
end