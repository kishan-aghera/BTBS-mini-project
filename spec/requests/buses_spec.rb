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
      get buses_path, 
      :params => { 
        bus: { 
         from_busport_id: nil, 
          to_busport_id: create(:bus).id.to_s, 
          pax: "1", 
          day: "25", 
          month: "12", 
          year: "2020" 
        } 
      }
      expect(response).to be_successful
    end

    it "flashes no alert message when every params are passed" do
      get buses_path,
      :params => { 
        bus: { 
          from_busport_id: create(:bus).id.to_s, 
          to_busport_id: create(:bus).id.to_s, 
          pax: "1", 
          day: "25", 
          month: "12", 
          year: "2020" 
        }
      }
      expect(flash[:alert]).to_not be_present
    end
    
    it "flashes an alert message when to bus is blank" do
      get buses_path,
      :params => { 
        bus: { 
          from_busport_id: create(:bus).id.to_s, 
          to_busport_id: nil, 
          pax: "1", 
          day: "25", 
          month: "12", 
          year: "2020" 
        }
      }
      expect(response).to_not render_template("search_form_results")
    end

    it "flashes an alert message when pax is blank" do
      get buses_path, 
      :params => { 
        bus: { 
          from_busport_id: create(:bus).id.to_s, 
          to_busport_id: create(:bus).id.to_s, 
          pax: nil, 
          day: "25", 
          month: "12", 
          year: "2020" 
        } 
      }
      expect(response).to_not render_template("search_form_results")
    end

    it "flashes an alert message when from and to is same" do
      get buses_path, 
      :params => { 
        bus: { 
          from_busport_id: "1", 
          to_busport_id: "1", 
          pax: "1", 
          day: "25", 
          month: "12", 
          year: "2020" 
        } 
      }
      expect(response).to_not render_template("search_form_results")
    end
  end
end
