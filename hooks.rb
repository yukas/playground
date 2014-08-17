require "./setup"

module Hooks
  def included(base)
    puts "Module #{self} just included to #{base.name}"
  end
  
  def extended(base)
    puts "Module #{self} just extended #{base.name}"
  end
  
  def append_features(base)
    puts "Append features called with class #{base.name}"
  end
  
  def prepend_features(base)
    puts "Prepend features called with class #{base.name}"
  end
  
  def inherited(subclass)
    puts "Class #{subclass.name} just inherited #{self}"
  end
  
  def method_added(method_name)
    puts "Instance method :#{method_name} added to #{self}"
  end
  
  def singleton_method_added(method_name)
    puts "Singleton method :#{method_name} added to #{self}"
  end
end

module M
  extend Hooks
end

class A
  extend Hooks
  include M
end
