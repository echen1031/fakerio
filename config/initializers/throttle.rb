require "redis"

if Rails.env.development?
  redis_conf  = YAML.load(File.join(Rails.root, "config", "redis.yml"))
  REDIS = Redis.new(:host => redis_conf["host"], :port => redis_conf["port"])
end

if Rails.env.production?
  uri = URI.parse(ENV["REDISTOGO_URL"])
  REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
end

THROTTLE_TIME_WINDOW = 15 * 60
THROTTLE_MAX_REQUESTS = 60
