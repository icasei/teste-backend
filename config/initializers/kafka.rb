
puts "Kafka | Environment: #{Rails.env}"

DeliveryBoy.configure do |config|
    config.brokers = ["kafka:9093"]
end

Racecar.configure do |config|
    config.brokers = ["localhost:9092"]
end