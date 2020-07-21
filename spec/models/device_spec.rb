# frozen_string_literal: true

require "rails_helper"

RSpec.describe Device, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :serial }
    it { is_expected.to validate_uniqueness_of :serial }
  end
end
