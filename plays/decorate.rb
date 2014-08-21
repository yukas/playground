require "../setup"

class User
  def name
    "Coco"
  end
end

def decorate(objects, &block)
  mod_with_methods = Module.new(&block)
  
  objects = Array(objects).map do |object|
    object.dup.extend(mod_with_methods)
  end
  
  objects.length > 1 ? objects : objects.first
end

decorated_user = decorate(User.new) {
  def prefixed_name
    "Dear mr. #{name}"
  end
}

puts decorated_user.prefixed_name