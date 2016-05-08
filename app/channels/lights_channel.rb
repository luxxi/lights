class LightsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "lights_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def switch(data)
    ActionCable.server.broadcast 'lights_channel', state: data['state'], type: data['type']
  end
end
