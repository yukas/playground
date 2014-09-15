module Helper
  def foo(arg)
    "foo-#{arg}"
  end
end

class Controller
  def do
    @data = Model.new([1,3]).data
  end
end

class View
  include Helper
  
  def display
    puts @data
  end
end

class Model
  attr_accessor :data
  
  def initialize(data)
    @data = data
  end
end