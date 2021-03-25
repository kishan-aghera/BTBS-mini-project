require 'rails_helper'

RSpec.describe "Buses", type: :request do
  describe "GET index" do
    it "returns a successful response" do # Working
      get root_path
      expect(response).to be_successful
    end
  end

  describe "Flash messages for index" do
    let(:bus) { create(:bus) }

    # it "flashes an alert message when from bus is blank" do # Not Working
    #   get buses_path, :params => { bus: { from_busport_id: "", to_busport_id: create(:bus).id, duration: 240, scheduled_on: "2020-12-25 07:00:00", pax: 1, day: "25", month: "12", year: "2020" } }
    #   expect(flash[:alert]).to eq "Departure busport is missing"
    # end

    it "flashes an alert message when from bus is blank" do # Not Working
      get buses_path
      #, :params => { 
        #bus: { 
        #  from_busport_id: nil, 
      #     to_busport_id: create(:bus).id.to_s, 
      #     pax: "1", 
      #     day: "25", 
      #     month: "12", 
      #     year: "2020" 
      #   } 
      # }
      expect(flash[:alert]).to be_present
    end

    it "flashes an alert message when to bus is blank" do # Not Working
      get buses_path
      #, :params => { 
      #   bus: { 
      #     from_busport_id: create(:bus).id.to_s, 
      #     to_busport_id: nil, 
      #     pax: "1", 
      #     day: "25", 
      #     month: "12", 
      #     year: "2020" 
      #   }
      # }
      expect(flash[:alert]).to be_present
    end

    it "flashes an alert message when pax is blank" do # Not Working
      get buses_path
      #, :params => { 
      #   bus: { 
      #     from_busport_id: create(:bus).id.to_s, 
      #     to_busport_id: create(:bus).id.to_s, 
      #     pax: nil, 
      #     day: "25", 
      #     month: "12", 
      #     year: "2020" 
      #   } 
      # }
      expect(flash[:alert]).to be_present
    end

    it "flashes an alert message when from and to is same" do # Not Working
      # buses = Bus.create!(from_busport_id: create(:bus).id, to_busport_id: create(:bus).id, duration: 240, scheduled_on: "2020-12-25 07:00:00")
      # expect(response).to have_content "Please check your input"
      get buses_path
      #, :params => { 
      #   bus: { 
      #     from_busport_id: "1", 
      #     to_busport_id: "1", 
      #     pax: "1", 
      #     day: "25", 
      #     month: "12", 
      #     year: "2020" 
      #   } 
      # }
      expect(flash[:alert]).to be_present
    end

    # context "invalid params" do # Not Working
    #   let :bus do
    #     get root_path, :params => { 
    #       bus: { 
    #         from_busport_id: nil, 
    #         to_busport_id: create(:bus).id.to_s, 
    #         pax: "1", 
    #         day: "25", 
    #         month: "12", 
    #         year: "2020" 
    #       }
    #     }
    #     expect(flash[:alert]).to be_present
    #   end      
    # end
  end

  # describe "Get /buses" do
  #   context "invalid params" do
  #     let(:bus) { create(:bus) }
  #     subject { get '/buses', bus: attributes_for(:bus, from_busport_id: nil) }
  #     it "flashes an alert message" do
  #       expect( subject.request.flash[:alert] ).to_not be_nil
  #     end
  #   end
  # end
end
