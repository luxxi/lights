class LightBroadcastJob < ApplicationJob
  queue_as :default

  def perform(light)
    client = Particle::Client.new
    client.device('lights').call(light.state, light.name)
  rescue Particle::Error
    light.update state: !light.state
  ensure
    ActionCable.server.broadcast 'lights_channel', state: light.state, type: light.id
  end
end
