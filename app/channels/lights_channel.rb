class LightsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_from "lights_channel"
  end

  def switch(data)
    light = Light.find(data['type'])
    light.update! state: data['state']
  end
end
