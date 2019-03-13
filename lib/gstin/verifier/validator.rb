module Gstin
  module Verifier
    module Validator
      extend self

      def validate_config_params
        raise Error::ConfigError, "Mastersindia api username is missing" unless ENV['MASTERSINDIA_USERNAME'].present?
        raise Error::ConfigError, "Mastersindia api password is missing" unless ENV['MASTERSINDIA_PASSWORD'].present?
        raise Error::ConfigError, "Mastersindia api client_id is missing" unless ENV['MASTERSINDIA_CLIENT_ID'].present?
        raise Error::ConfigError, "Mastersindia api client_secret is missing" unless ENV['MASTERSINDIA_CLIENT_SECRET'].present?
      end
    end
  end
end