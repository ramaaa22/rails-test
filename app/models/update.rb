class Update < ApplicationRecord
  validates_presence_of :free_mem, :uptime, :load, :device_id
  belongs_to :device
end
