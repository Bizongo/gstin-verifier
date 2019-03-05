require "gstin/verifier/version"
require 'active_support/core_ext/object'
require 'active_support/json'
require 'httparty'
Dir[File.expand_path('../gstin/verifier/*.rb', File.dirname(__FILE__))].each { |file| require file }

module Gstin
  module Verifier
    extend Provider
  end
end