class UserConsumerConsumer < Racecar::Consumer
  subscribes_to "contacts_message"
  #subscribes_to "logs_message"

  def process(message)
    puts "Received message: #{message.value}"
  end
  
end
