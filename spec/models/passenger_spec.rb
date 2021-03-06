require 'rails_helper'

RSpec.describe Passenger, type: :model do
  before(:all) do
    @passenger = create(:passenger)
  end

  it "is valid with valid attributes" do
    expect(@passenger).to be_valid
  end

  it "is not valid without name" do
    passenger = build(:passenger, name: nil)
    expect(passenger).to_not be_valid
  end

  it "is not valid without email" do
    passenger = build(:passenger, email: nil)
    expect(passenger).to_not be_valid
  end

  context 'validation tests' do
    it 'ensures name presence' do
      passenger = Passenger.new(email: "sample@example.com", booking_id: 1).save
      expect(passenger).to eq(false)
    end

    it 'ensures email presence' do
      passenger = Passenger.new(name: "Name", booking_id: 1).save
      expect(passenger).to eq(false)
    end

    it 'should save successfuly' do
      passenger = Passenger.new(name: "Name", email: "sample@example.com", booking_id: 1).save
      expect(passenger).to eq(true)
    end
  end

  it "triggers normalize_name on save" do
    expect(@passenger).to receive(:normalize_name)
    @passenger.save
  end

  it "triggers email_downcase on save" do
    expect(@passenger).to receive(:email_downcase)
    @passenger.save
  end
end
