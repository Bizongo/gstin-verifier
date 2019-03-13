module Gstin
  module Verifier
    module Parser
      extend self

      # excepts json and returns hash
      def parse(response)
        {
            gstin: response['gstin'],
            trade_name: response['lgnm'],
            taxpayer_type: response['dty'],
            status: response['sts'],
            last_updated: response['lstupdt'],
            cancellation_date: response['cxdt'],
            registration_date: response['rgdt'],
            constitution_of_business: response['ctb'],
            state_jurisdiction_code: response['stjCd'],
            centre_jurisdiction_code: response['ctjCd'],
            centre_jurisdiction: response['ctj'],
            business_activity_nature: response['nba'],
            primary_address: parse_address(response['pradr']['addr'], response['pradr']['ntr']),
            additional_addresses: parse_additional_address(response['adadr']),
        }
      end

      private
      def parse_additional_address(addresses)
        addresses.each_with_object([]) { |address, addr_response| addr_response << parse_address(address['addr'], address['ntr']) }
      end

      def parse_address(addr_params, ntr)
        {
            floor_number: addr_params['flno'],
            buiding_number: addr_params['bno'],
            buiding_name: addr_params['bnm'],
            street: addr_params['st'],
            location: addr_params['loc'],
            city: addr_params['city'],
            district: addr_params['dst'],
            state: addr_params['stcd'],
            pin_code: addr_params['pncd'],
            lattitute: addr_params['lt'],
            longitute: addr_params['lg'],
            principal_place_business_nature: ntr
        }
      end
    end
  end
end