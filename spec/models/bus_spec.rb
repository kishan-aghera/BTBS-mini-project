require 'rails_helper'

RSpec.describe Bus, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should belong_to(:from_busport)}
  it {should belong_to(:to_busport)}
end
