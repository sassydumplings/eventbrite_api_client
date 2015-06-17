require 'spec_helper'
require 'pry'

describe EventbriteApiClient do
  subject { EventbriteApiClient.new(auth_token: 123) }

  describe '#initialize' do
    it 'should set headers' do
      expect(subject.class.headers)
        .to eq('Authorization' => 'Bearer 123')
    end
  end

  describe '#method_missing' do
    let(:client) { subject.events }
    let(:params) { subject.events(24) }

    it 'should update the path' do
      expect(client.path).to eq('/events')
    end

    it 'should add params' do
      expect(params.path).to eq('/events/24')
    end

    context 'chained calls' do
      let(:nested) { client.search }
      let(:nested_params) { params.search(48) }

      it 'should update the path' do
        expect(nested.path).to eq('/events/search')
      end

      it 'should add params' do
        expect(nested_params.path).to eq('/events/24/search/48')
      end
    end
  end
end
