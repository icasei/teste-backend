class LogConsumer < Racecar::Consumer
  subscribes_to "logs_message"

  #initialize redis db for message logs
  def initialize
    if @redis = Redis.new(host: "127.0.0.1", port: "6379")
      puts 'redis connected'
    else
      puts @redis.errors
    end
  end

  #generate id with random
  def generate_id
    id = ["A"]
    5.times{id<<SecureRandom.random_number(9)}
    id = id.join
    return id
  end

  def process(message)
    data = JSON.parse(message.value)
    id = generate_id
    puts "id: #{id} ==> Received message: #{data}"
    
    #set data with generated id as key
    if @redis.set(id, data)
      puts "send to Redis!!"
    else 
      puts @redis.errors
    end
  end
end
