module Gstin
  module Verifier
    module Api
      include HTTParty
      extend self

      def execute(method: :get, uri: nil, params: nil)
        case method
        when :get
          HTTParty.get(uri, :headers => params)
        else
          HTTParty.send(method, uri, :headers => {"Content-Type" => "application/json"}, :body => params.to_json)
        end
      end

      def get_auth_token
        uri = Gstin::Verifier::Configuration.base_uri + '/oauth/access_token'
        response = execute(method: :post, uri: uri, params: Gstin::Verifier::Configuration.config_params)
        response['access_token']
      end
    end
  end
end