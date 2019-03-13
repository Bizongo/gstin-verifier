# Gstin::Verifier
## Use case
- Using Masters India API(https://www.mastersindia.co/)
- Returns company details using gstin number.
- Returns Parsed address of a company in readable form.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "gstin-verifier", git: "git@github.com:Bizongo/gstin-verifier.git", branch: "master"
```

or you can specify latest verison

```ruby
gem "gstin-verifier", '0.0.2', git: "git@github.com:Bizongo/gstin-verifier.git"
```


## Configuration

Get credentials from Masters India and then configure them as ENV variables.

```ruby
ENV['MASTERSINDIA_USERNAME'] = "bla@gmail.com"
ENV['MASTERSINDIA_PASSWORD'] = "blabla"
ENV['MASTERSINDIA_CLIENT_ID'] = "blalalal"
ENV['MASTERSINDIA_CLIENT_SECRET'] = "blalalalaalala"
```

## Usage

```ruby
Gstin::Verifier::Provider.get_address_from_gstin_number('123456')
```
API excepts 2 arguments `gstin_number` and `testing`

By default `testing` is true and this api will return a dummy response which you can use for staging or testing environment.

You need to set `testing` false to get response from mastersindia api.

```ruby
Gstin::Verifier::Provider.get_address_from_gstin_number('12345678', false)
```

or 

```ruby
Gstin::Verifier::Provider.get_address_from_gstin_number('12345678', !Rails.env.production?)
```

Response will be hash of addesses
```ruby
{
  :gstin=>"45AAVCS6045D1Z0",
  :trade_name=>"ABCD TECHNOLOGY PRIVATE LIMITED",
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
    :buiding_name=>"Tea House",
    :street=>"Saki Vihar Road",
    :location=>"Andheri E",
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
      :floor_number=>"Village Sonale",
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
      :buiding_name=>"ABC Hi-Tech Park,",
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
```

You can also check how many requests has been fired to Api till now

```ruby
Gstin::Verifier::Provider.fired_request_count
```

## Deployment

For deploy your changes
 - Create a branch from master branch.
 - Make your changes.
 - Run `rake spec` to run all the test cases.
 - Update version.rb to new version.
 - Get a review and then merge.
 - Create a release with updated version.

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/Bizongo/gstin-verifier.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
Add this line to your application's Gemfile:

