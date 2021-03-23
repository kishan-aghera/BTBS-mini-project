require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET /show" do
    let(:bus) { create(:bus) }
    let(:booking) { create(:booking) }

    it "returns bookings show page" do
      booking = Booking.create!(bus_id: create(:bus).id)
      get "/bookings/#{booking.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:bus) { create(:bus) }
    let(:booking) { create(:booking) }

    it "Go to passenger details" do
      post bookings_path, :params => { booking: { bus_id: create(:bus).id, passenger: attributes_for(:passenger) } }
      expect(response).to have_http_status(302)
    end

    context "invalid params" do
      let :booking do
        post bookings_path, :params => { 
          booking: { 
            bus_id: create(:bus).id, passenger: attributes_for(:passenger, name: "") 
          } 
        }
      end

      it "does not add passenger and re-render :new page" do
        expect { booking }.to change(Booking, :count)
        expect(response).to_not be_redirect
        expect(response).to render_template("new")
      end
    end
  end


  describe "GET /new" do
    let(:bus) { create(:bus) }
    let(:booking) { create(:booking) }

    it "Passenger details page" do
      booking = Booking.create!(id: create(:booking).id+1, bus_id: create(:bus).id)
      get "/bookings/#{booking.bus_id}"
      expect(response).to have_http_status(200)
    end
  end
end
