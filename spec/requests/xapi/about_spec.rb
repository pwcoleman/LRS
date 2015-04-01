describe 'About API' do

  it 'returns information about the LRS' do
    get '/xapi/about'
    expect(response).to be_success
    expect(json['X-Experience-API-Version']).to eq('1.0.1')
    expect(json['version']).to include('1.0.1')
  end

  context 'errors' do
    it 'rejects GET /xapi/abouts' do
      get '/xapi/abouts'
      expect(response).to be_bad_request
      expect(json['error']).to eq(true)
      expect(json['success']).to eq(false)
      expect(json['code']).to eq(400)
    end

    it 'rejects POST /xapi/about' do
      post '/xapi/about'
      expect(response).to be_method_not_allowed
      expect(json['error']).to eq(true)
      expect(json['success']).to eq(false)
      expect(json['code']).to eq(405)
    end

    it 'rejects PUT /xapi/about' do
      put '/xapi/about'
      expect(response).to be_method_not_allowed
      expect(json['error']).to eq(true)
      expect(json['success']).to eq(false)
      expect(json['code']).to eq(405)
    end

    it 'rejects DELETE /xapi/about' do
      delete '/xapi/about'
      expect(response).to be_method_not_allowed
      expect(json['error']).to eq(true)
      expect(json['success']).to eq(false)
      expect(json['code']).to eq(405)
    end
  end

end