require 'rails_helper'

RSpec.describe Bus, type: :model do
  it {should belong_to(:from_busport)}
  it {should belong_to(:to_busport)}
end
