FactoryBot.define do
  factory :update do
    uptime { 1 }
    load { 1.5 }
    free_mem { 1 }
    device { nil }
  end
end
