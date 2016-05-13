class LightsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lights = Light.order(:id)
  end
end
