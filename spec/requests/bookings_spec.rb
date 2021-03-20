require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET /show" do
    it "returns bookings show page" do
      booking = Booking.create!(bus_id: 1)
      get "/bookings/#{booking.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "Go to passenger details" do
      post bookings_path, :params => { booking: { bus_id: 1, passenger: attributes_for(:passenger) } }
      expect(response).to have_http_status(302)
    end
    
    # it "Invalid params" do
    #   post bookings_path, :params => { booking: { bus_id: 1, passenger: attributes_for(:passenger), name: nil } }
    #   expect(response).to render_template(:new)
    #   # it { expect { manager }.to_not change(Manager, :count) }
    # end

    context "invalid params" do
      let :booking do
        post bookings_path, :params => { booking: { bus_id: 1, passenger: attributes_for(:passenger, email: nil) } }
      end

      it { expect { booking }.to_not change(Booking, :count) }
    end

    # context "without valid params" do
    #   let :booking do
    #     post "/bookings", :params => { booking: {bus_id: nil} }
    #   end
    # end
  end


  describe "GET /new" do
    it "Passenger details page" do
      booking = Booking.create!(id: 2, bus_id: 1)
      get "/bookings/#{booking.bus_id}"
      expect(response).to have_http_status(200)
    end
  end
end
