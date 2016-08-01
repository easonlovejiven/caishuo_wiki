初始化的时候用：
Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_SERVER_ADDRESS']}:#{ENV['REDIS_SERVER_PORT']}/0",
                   password: "#{ENV['REDIS_PASSWORD']}",
                   namespace: "kalading-sidekiq/#{Rails.env}",
                   driver: :hiredis }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_SERVER_ADDRESS']}:#{ENV['REDIS_SERVER_PORT']}/0",
                   password: "#{ENV['REDIS_PASSWORD']}",
                   namespace: "kalading-sidekiq/#{Rails.env}",
                   driver: :hiredis }
end

