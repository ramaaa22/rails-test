# frozen_string_literal: true

require "rails_helper"

RSpec.describe Device, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :serial }
    it { is_expected.to validate_uniqueness_of :serial }

    it "verify number of device's updates" do
      device = Device.create(serial:"device-zzz")
      device.updates.create(uptime:10,load:10.0,free_mem:10)
      device.updates.create(uptime:20,load:20.0,free_mem:20)
      assert_equal 2, device.updates.length
    end
  end
end
