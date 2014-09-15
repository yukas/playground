module Faraday
  def self.register_middleware(middleware)
    puts middleware
  end
end

class PutsUrlMiddleware
  Faraday.register_middleware('PutsUrlMiddleware')
end
