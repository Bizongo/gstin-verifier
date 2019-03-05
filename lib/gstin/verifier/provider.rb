module Gstin
  module Verifier
    module Provider
      extend self

      def get_address_from_gstin_number(gstin_number, testing = true)
        gstin_regexp = /\A[0-9]{2}+[A-Z]{5}+[0-9]{4}+[A-Z]{1}+[1-9A-Z]{1}+Z+[0-9A-Z]{1}+\z/
        raise Error::CommonError, "#{gstin_number} is invalid GSTIN Number" if gstin_number.to_s !~ gstin_regexp
        return Gstin::Verifier::Response.dummy_response if testing

        uri = Gstin::Verifier::Configuration.base_uri + '/commonapis/searchgstin?gstin=' + gstin_number
        response = Gstin::Verifier::Api.execute(uri: uri, params: Gstin::Verifier::Configuration.auth_params)

        raise Error::CommonError, response['data'] if response['error'].present?

        Gstin::Verifier::Parser.parse(response['data'])
      end

      def fired_request_count
        uri = Gstin::Verifier::Configuration.base_uri + '/commonapis/countapi?action=count'
        response = Gstin::Verifier::Api.execute(uri: uri, params: Gstin::Verifier::Configuration.auth_params)

        raise Error::CommonError, response['data'] if response['error'].present?
        response["count"]
      end
    end
  end
end
