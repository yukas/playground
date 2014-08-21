class A
  def initialize
    @iv1 = 1
    @iv2 = 2
    
    puts instance_variables.each_with_object({}) { |name, hash|
      hash[name.slice(1, name.length)] = instance_variable_get(name)
    }
  end
end

A.new