json.array! @updates do |up|
  json.uptime up.uptime
  json.load up.load
  json.free_mem up.free_mem
  json.device_id up.device_id
end