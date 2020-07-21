# frozen_string_literal: true

desc "Simulate devices activity"
task simulate: :environment do
  devices = Device.all

  loop do
    device = devices.sample
    data = {
      uptime: rand(20).to_i,
      load: rand(100),
      free_mem: rand(2048),
      device_id: device.id
    }
    

    puts "#{device.serial} sending #{data.to_json}"

    #records= Record.create(uptime:data[:uptime], load:data[:load], free_mem:data[:free_mem], device_id:device.id)

    Requests.request("POST", "http://localhost:3000/api/v1/updates", data: data, headers: { "X-Api-Key" => device.api_key })
  rescue StandardError => e
    puts "  => Error: #{e.message}"
  ensure
    sleep rand(1..2)
  end
end
