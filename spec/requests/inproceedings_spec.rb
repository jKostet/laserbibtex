require 'rails_helper'

RSpec.describe "Inproceedings", type: :request do
  describe "GET /inproceedings" do
    it "works! (now write some real specs)" do
      get inproceedings_path
      expect(response).to have_http_status(200)
    end
  end
end
