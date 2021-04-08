require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET /show" do
    let(:bus) { create(:bus) }
    let(:booking) { create(:booking) }

    it "returns bookings show page" do # Working
      booking = Booking.create!(bus_id: create(:bus).id)
      get "/bookings/#{booking.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:bus) { create(:bus) }
    let(:booking) { create(:booking) }

    it "Go to passenger details" do # Working
      post bookings_path, :params => { 
        booking: { 
          bus_id: create(:bus).id, passenger: attributes_for(:passenger) 
        }
      }
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /new" do
    let(:bus) { create(:bus) }
    let(:booking) { create(:booking) }

    it "Passenger details page" do # Working
      booking = Booking.create!(bus_id: create(:bus).id)
      get "/bookings/#{booking.id}"
      expect(response).to have_http_status(200)
    end
  end
end
