require 'rails_helper'

RSpec.describe Xapi::AboutController, type: :controller do

  render_views

  let(:json) { JSON.parse(response.body) }

  describe 'GET /about' do
    it 'returns information about the LRS' do
      get 'index', format: :json

      expect(json['X-Experience-API-Version']).to eq('1.0.1')
      expect(json['version']).to include('1.0.1')
    end
  end

end
