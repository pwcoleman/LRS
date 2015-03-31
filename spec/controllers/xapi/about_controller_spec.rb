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

  describe 'GET /abouts' do
    it 'fails' do
      expect(get: '/xapi/abouts', format: :json).not_to be_routable
    end
  end

  describe 'POST /about' do
    it 'fails' do
      expect(post: '/xapi/about', format: :json).not_to be_routable
    end
  end

  describe 'PUT /about' do
    it 'fails' do
      expect(put: '/xapi/about', format: :json).not_to be_routable
    end
  end

  describe 'DELETE /about' do
    it 'fails' do
      expect(delete: '/xapi/about', format: :json).not_to be_routable
    end
  end

end
