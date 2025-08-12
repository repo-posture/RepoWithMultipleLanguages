require 'sinatra'
require 'sinatra/json'
require 'redis'
require 'faraday'
require 'pg'
require 'devise'

# Configure Sinatra
set :port, 3001
set :bind, '0.0.0.0'

# Setup Redis connection (will fail gracefully if Redis not available)
def redis
  @redis ||= begin
    Redis.new
  rescue Redis::CannotConnectError => e
    puts "Redis connection error: #{e.message}"
    nil
  end
end

# Define model-like classes
class User
  attr_accessor :id, :name, :email
  
  def initialize(id, name, email)
    @id = id
    @name = name
    @email = email
  end
  
  def to_json(*)
    { id: @id, name: @name, email: @email }.to_json
  end
  
  def self.all
    [
      User.new(1, 'Alice', 'alice@example.com'),
      User.new(2, 'Bob', 'bob@example.com'),
      User.new(3, 'Charlie', 'charlie@example.com')
    ]
  end
end

# Home route
get '/' do
  'SBOM Test Ruby App is running!'
end

# Users route
get '/api/users' do
  json User.all
end

# External API call
get '/api/external' do
  begin
    response = Faraday.get('https://jsonplaceholder.typicode.com/posts/1')
    
    if response.status == 200
      content_type :json
      response.body
    else
      status 500
      json error: "Failed to fetch external data: #{response.status}"
    end
  rescue => e
    status 500
    json error: "Exception: #{e.message}"
  end
end

# Redis demo route (will return fallback data if Redis not available)
get '/api/cache' do
  if redis
    # Try to get data from Redis, or set it if not exists
    data = redis.get('example_key')
    unless data
      data = { timestamp: Time.now.to_i, message: 'Hello from Redis!' }.to_json
      redis.set('example_key', data)
      redis.expire('example_key', 60) # Expire after 60 seconds
    end
    content_type :json
    data
  else
    # Fallback if Redis not available
    json timestamp: Time.now.to_i, message: 'Redis not available, using fallback data'
  end
end

# Status route
get '/api/status' do
  json status: 'OK', timestamp: Time.now.to_i
end
