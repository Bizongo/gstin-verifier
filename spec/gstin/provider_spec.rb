require 'spec_helper'

RSpec.describe Gstin::Verifier::Provider  do
  let(:gstin_number) { "22AAAAA0000A1Z5" }
  let(:get_address_uri) { Gstin::Verifier::Configuration.base_uri + '/commonapis/searchgstin?gstin=' + gstin_number }
  let(:request_count_uri) { Gstin::Verifier::Configuration.base_uri + '/commonapis/countapi?action=count' }
  let(:dummy_address) { {"name" => "Bizongo", "city" => "mumbai"}}
  let(:dummy_api_response) { {"error"=>false, "data"=> dummy_address.to_json }}
  let(:error_message) { "Invalid Gstin token"}
  let(:error_response) { {"error"=>true, "data"=> error_message}}

  context ".get_address_from_gstin_number" do
    it 'should raise invalid token error' do
      expect(Gstin::Verifier::Configuration).to receive(:auth_params).and_return("dummt_auth").twice
      expect(Gstin::Verifier::Api).to receive(:execute).with({uri: get_address_uri, params: Gstin::Verifier::Configuration.auth_params}).and_return(error_response)
      expect { Gstin::Verifier::Provider.get_address_from_gstin_number(gstin_number, false) }.to raise_error(error_message)
    end

    it 'should return address for a given gstin' do
      expect(Gstin::Verifier::Configuration).to receive(:auth_params).and_return("dummt_auth").twice
      expect(Gstin::Verifier::Api).to receive(:execute).with({uri: get_address_uri, params: Gstin::Verifier::Configuration.auth_params}).and_return(dummy_api_response)
      expect(Gstin::Verifier::Parser).to receive(:parse).with(dummy_api_response['data']).and_return(dummy_address)
      response = Gstin::Verifier::Provider.get_address_from_gstin_number(gstin_number, false)

      #this line can be removed
      expect(response).to eq dummy_address
    end
  end

  context ".fired_request_count" do
    it 'should raise invalid token error' do
      expect(Gstin::Verifier::Configuration).to receive(:auth_params).and_return("dummt_auth").twice
      expect(Gstin::Verifier::Api).to receive(:execute).with({uri: request_count_uri, params: Gstin::Verifier::Configuration.auth_params}).and_return(error_response)
      expect { Gstin::Verifier::Provider.fired_request_count }.to raise_error(error_message)
    end

    it 'should return pending requests count' do
      request_count = 50
      count_api_response = {"error"=>false, "count"=> request_count}
      expect(Gstin::Verifier::Configuration).to receive(:auth_params).and_return("dummt_auth").twice
      expect(Gstin::Verifier::Api).to receive(:execute).with({uri: request_count_uri, params: Gstin::Verifier::Configuration.auth_params}).and_return(count_api_response)
      response = Gstin::Verifier::Provider.fired_request_count

      #this line can be removed
      expect(response).to eq request_count
    end
  end
end