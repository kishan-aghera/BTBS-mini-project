require 'rails_helper'

RSpec.describe "Buses", type: :request do
  describe "GET index" do
    it "returns a successful response" do
      get root_path
      expect(response).to be_successful
    end
  end
end
