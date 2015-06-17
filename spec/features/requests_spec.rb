require 'spec_helper'
require 'pry'

describe 'Requests' do
  subject { EventbriteApiClient.new(auth_token: 'BKKRDKVUVRC5WG4HAVLT') }

  describe 'get event details' do
    context 'on success' do
      let(:response) { subject.events(10584525601).get() }

      it 'should return a response' do
        expect(response).to be_a(Hash)
        expect(response['resource_uri'])
          .to eq('https://www.eventbriteapi.com/v3/events/10584525601/')
      end
    end

    context 'on failure' do
      let(:failed) { subject.events(1).get() }

      it 'should error gracefully' do
        expect(failed).to be_a(Hash)
        expect(failed['status_code']).to eq(404)
      end
    end
  end

  describe 'search events' do
    context 'on success' do
      let(:response) { subject.events.search.get(q: 'Free Beer') }

      it 'should return a response' do
        expect(response).to be_a(Hash)
        expect(response).to include('pagination')
        expect(response).to include('events')
      end
    end
  end

  describe 'polling an invalid API endpoint' do
    let(:response) { subject.foo.get() }

    it 'should error gracefully' do
      expect(response).to be_a(Hash)
      expect(response['status_code']).to eq(404)
    end
  end
end
