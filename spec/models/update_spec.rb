require 'rails_helper'

RSpec.describe Update, type: :model do
  subject {
    described_class.new(uptime: 10,
                        load: 10.0,
                        free_mem: 10,
                        device_id: 1)
  }

  it "is not valid without free_mem" do
    subject.free_mem = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without device_id" do
    subject.device_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without uptime" do
    subject.uptime = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without load" do
    subject.load = nil
    expect(subject).to_not be_valid
  end

  
  describe "Associations" do
    it { should belong_to(:device).without_validating_presence }
  end

  
  
end
