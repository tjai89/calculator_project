require 'rails_helper'


RSpec.describe InterestCalculatorController, type: :controller do

  describe "GET #InterestCalculator" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end