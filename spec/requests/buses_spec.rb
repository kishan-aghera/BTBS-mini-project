require 'rails_helper'

RSpec.describe "Buses", type: :request do
  describe "GET index" do
    it "returns a successful response" do
      get root_path
      expect(response).to be_successful
    end
  end

  describe "Flash messages for index" do
    let(:bus) { create(:bus) }

    it "flashes an alert message when from bus is blank" do
      get buses_path, :params => { bus: { from_busport_id: "", to_busport_id: create(:bus).id, duration: 240, scheduled_on: "2020-12-25 07:00:00", pax: 1, day: "25", month: "12", year: "2020" } }
      expect(flash[:alert]).to_not be_present
    end

    it "flashes an alert message when to bus is blank" do
      get buses_path, :params => { bus: { from_busport_id: create(:bus).id, to_busport_id: "", duration: 240, scheduled_on: "2020-12-25 07:00:00", pax: "1", day: "25", month: "12", year: "2020" } }
      expect(flash[:alert]).to_not be_present
    end

    it "flashes an alert message when pax is blank" do
      get buses_path, :params => { bus: { from_busport_id: create(:bus).id, to_busport_id: create(:bus).id, duration: 240, scheduled_on: "2020-12-25 07:00:00", pax: "", day: "25", month: "12", year: "2020" } }
      expect(flash[:alert]).to_not be_present
    end

    it "flashes an alert message when from and to is same" do
      buses = Bus.create!(from_busport_id: create(:bus).id, to_busport_id: create(:bus).id, duration: 240, scheduled_on: "2020-12-25 07:00:00")
      expect(response).to have_content "Please check your input"
    end

    context "invalid params" do
      let :bus do
        get root_path, :params => { bus: { from_busport_id: nil, to_busport_id: create(:bus).id, duration: 240, scheduled_on: "2020-12-25 07:00:00"}, pax: "1", day: "25", month: "12", year: "2020" }
        expect(flash[:alert]).to_not be_present
      end      
    end
  end
end
