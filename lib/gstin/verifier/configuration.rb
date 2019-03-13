module Gstin
  module Verifier
    module Configuration
      extend self

      def auth_params
        auth_token = Gstin::Verifier::Api.get_auth_token
        {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{auth_token}",
          "client_id" => config_params[:client_id]
        }
      end

      def config_params
        Gstin::Verifier::Validator.validate_config_params

        {
          username: ENV['MASTERSINDIA_USERNAME'],
          password: ENV['MASTERSINDIA_PASSWORD'],
          client_id: ENV['MASTERSINDIA_CLIENT_ID'],
          client_secret:  ENV['MASTERSINDIA_CLIENT_SECRET'],
          grant_type: "password"
        }
      end

      def base_uri
        'https://commonapi.mastersindia.co'
      end
    end
  end
end
