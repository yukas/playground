require '../setup'
require 'faraday'

class PutsUrlMiddleware
  def initialize(app, options = {})
    @app = app
    @options = options
  end
  
  def call(env)
    puts env[:url]
    app.call(env)
  end
  
  private
    attr_accessor :app, :options
end

conn = Faraday.new(url: 'https://api.github.com') do |c|
  c.use Faraday::Request::UrlEncoded  # encode request params as "www-form-urlencoded"
  # c.use Faraday::Response::Logger     # log request & response to STDOUT
  c.use Faraday::Adapter::NetHttp     # perform requests with Net::HTTP
  c.use PutsUrlMiddleware
end

response = conn.get '/repos/technoweenie/faraday'     # GET http://sushi.com/nigiri/sake.json
conn.post '/nigiri', { :name => 'Maguro' }  # POST "name=maguro" to http://sushi.com/nigiri