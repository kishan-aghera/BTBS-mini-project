require 'rails_helper'

RSpec.describe "Buses", type: :request do
  describe "GET index" do
    it "returns a successful response" do
      get root_path
      expect(response).to be_successful
    end
  end

  describe "Flash messages for index" do
    it "flashes an alert message when from bus is blank" do
      buses = Bus.create!(from_busport_id: nil, to_busport_id: 2, duration: 240, scheduled_on: "2020-12-25 07:00:00", pax: 1, day: 25, month: 12, year: 2020)
      expect( buses.request.flash[:alert] ).to_not be_nil
    end

    it "flashes an alert message when to bus is blank" do
      buses = Bus.create!(from_busport_id: 1, to_busport_id: nil, duration: 240, scheduled_on: "2020-12-25 07:00:00", pax: 1, day: 25, month: 12, year: 2020)
      expect( buses.request.flash[:alert] ).to_not be_nil
    end

    it "flashes an alert message when pax is blank" do
      buses = Bus.create!(from_busport_id: 1, to_busport_id: 2, duration: 240, scheduled_on: "2020-12-25 07:00:00", pax: nil, day: 25, month: 12, year: 2020)
      expect( buses.request.flash[:alert] ).to_not be_nil
    end

    it "flashes an alert message when from and to is same" do
      buses = Bus.create!(from_busport_id: 1, to_busport_id: 1, duration: 240, scheduled_on: "2020-12-25 07:00:00")#, pax: 1, day: 25, month: 12, year: 2020)
      expect( buses.request.flash[:alert] ).to_not be_nil
    end
  end

  
end
