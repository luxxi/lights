class Light < ApplicationRecord
  after_update_commit { LightBroadcastJob.perform_later self }
end
