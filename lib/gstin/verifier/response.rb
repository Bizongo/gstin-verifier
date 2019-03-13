module Gstin
  module Verifier
    module Response
      extend self

      # return this response in case of staing/testing
      def dummy_response
        {
            :gstin=>"123AVCS6045D1Z0",
            :trade_name=>"ABC TECHNOLOGY PRIVATE LIMITED",
            :taxpayer_type=>"Regular",
            :status=>"Active",
            :last_updated=>"07/11/2018",
            :cancellation_date=>"",
            :registration_date=>"01/07/2017",
            :constitution_of_business=>"Private Limited Company",
            :state_jurisdiction_code=>"",
            :centre_jurisdiction_code=>"VM0805",
            :centre_jurisdiction=>"RANGE-V",
            :business_activity_nature=>[
                "Others",
                "Supplier of Services",
                "Recipient of Goods or Services",
                "Warehouse / Depot" ],
            :primary_address=> {
                :floor_number=>"",
                :buiding_number=>"3rd Floor , Gala no 04",
                :buiding_name=>"Abc House",
                :street=>"Saki Vihar Road",
                :location=>"Sakinaka, Andheri E",
                :city=>"",
                :district=>"Mumbai",
                :state=>"Maharashtra",
                :pin_code=>"400072",
                :lattitute=>"",
                :longitute=>"",
                :principal_place_business_nature=>"Others"
            },
            :additional_addresses=>[
                {
                    :floor_number=>"L7/8, Village Sonale",
                    :buiding_number=>"Rajlaxmi Hi-Tech Park,",
                    :buiding_name=>"",
                    :street=>"Nashik-Bhiwandi Bypass Road",
                    :location=>"Bhiwandi",
                    :city=>"",
                    :district=>"Thane",
                    :state=>"Maharashtra",
                    :pin_code=>"421302",
                    :lattitute=>"",
                    :longitute=>"",
                    :principal_place_business_nature=> "Supplier of Services, Recipient of Goods or Services, Warehouse / Depot"
                },
                {
                    :floor_number=>"",
                    :buiding_number=>"L7/L8",
                    :buiding_name=>"Rajlaxmi Hi-Tech Park,",
                    :street=>"Village Sonale",
                    :location=>"Bhiwandi",
                    :city=>"",
                    :district=>"Thane",
                    :state=>"Maharashtra",
                    :pin_code=>"421301",
                    :lattitute=>"",
                    :longitute=>"",
                    :principal_place_business_nature=>"Warehouse / Depot"
                }
            ]
        }
      end
    end
  end
end
