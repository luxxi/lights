class LightBroadcastJob < ApplicationJob
  queue_as :default

  def perform(light)
    ActionCable.server.broadcast 'lights_channel', state: light.state, type: light.id
  end
end
