require "spec_helper"

RSpec.describe Gstin::Verifier::Parser  do
  it 'should parse json response and return expected hash' do
    expected_response = Gstin::Verifier::Response.dummy_response
    request_hash = {"stjCd"=>"", "lgnm"=>"ABC TECHNOLOGY PRIVATE LIMITED", "dty"=>"Regular", "adadr"=>
      [{"addr"=>{"bnm"=>"", "loc"=>"Bhiwandi", "st"=>"Nashik-Bhiwandi Bypass Road", "bno"=>
      "Rajlaxmi Hi-Tech Park,", "stcd"=>"Maharashtra", "dst"=>"Thane", "city"=>"", "flno"=>
      "L7/8, Village Sonale", "lt"=>"", "pncd"=>"421302", "lg"=>""}, 
      "ntr"=>"Supplier of Services, Recipient of Goods or Services, Warehouse / Depot"}, 
      {"addr"=>{"bnm"=>"Rajlaxmi Hi-Tech Park,", "loc"=>"Bhiwandi", "st"=>"Village Sonale", "bno"=>"L7/L8", 
      "stcd"=>"Maharashtra", "dst"=>"Thane", "city"=>"", "flno"=>"", "lt"=>"", "pncd"=>"421301", "lg"=>""},
      "ntr"=>"Warehouse / Depot"}], "cxdt"=>"", "gstin"=>"123AVCS6045D1Z0", "nba"=>
      ["Others", "Supplier of Services", "Recipient of Goods or Services", "Warehouse / Depot"], 
      "lstupdt"=>"07/11/2018", "rgdt"=>"01/07/2017", "ctb"=>"Private Limited Company", "pradr"=>
      {"addr"=>{"bnm"=>"Abc House", "loc"=>"Sakinaka, Andheri E", "st"=>"Saki Vihar Road",
      "bno"=>"3rd Floor , Gala no 04", "stcd"=>"Maharashtra", "dst"=>"Mumbai", "city"=>"",
      "flno"=>"", "lt"=>"", "pncd"=>"400072", "lg"=>""}, "ntr"=>"Others"}, "tradeNam"=>"BIZONGO", 
      "sts"=>"Active", "ctjCd"=>"VM0805", "ctj"=>"RANGE-V"}
    response_data = Gstin::Verifier::Parser.parse(request_hash.as_json)
    expect(response_data.as_json.eql?(expected_response.as_json)).to eq true
  end
end