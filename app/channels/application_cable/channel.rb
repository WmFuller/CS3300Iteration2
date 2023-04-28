module ApplicationCable
  class ChatChannel < ApplicationCable::Channel
    def subscribed
      # Your subscription logic here
    end
  
    def unsubscribed
      # Any cleanup needed when the channel is unsubscribed
    end
  
    def send_message(data)
      # Your send message logic here
    end
  end
end
