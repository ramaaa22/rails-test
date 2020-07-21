# frozen_string_literal: true

class Device < ApplicationRecord
  validates :serial, presence: true, uniqueness: true
  has_many :updates
  make_api_key :api_key, 10
end
