require 'rubygems'
require 'test/unit'
require 'active_support/core_ext'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

##
# Simulate enough of ActiveRecord::Base that objects can be used for testing.
#
module ActiveRecord
  class Base

    def initialize
      @attributes = {}
    end

    def read_attribute(attr_name)
      @attributes[attr_name.to_sym]
    end

    def write_attribute(attr_name, value)
      @attributes[attr_name.to_sym] = value
    end

    def update_attribute(attr_name, value)
      write_attribute(attr_name.to_sym, value)
    end

    def self.scope(*args); end
  end
end

# Require Geocoder after ActiveRecord simulator.
require 'geocoder'

##
# Mock HTTP request to geocoding service.
#
module Geocoder
  module Lookup
    def self.fetch_raw_response(query, reverse = false)
      File.read(File.join("test", "fixtures", "madison_square_garden.json"))
    end
  end
end

##
# Geocoded model.
#
class Venue < ActiveRecord::Base
  geocoded_by :address

  def initialize(name, address)
    super()
    write_attribute :name, name
    write_attribute :address, address
  end

  ##
  # If method not found, assume it's an ActiveRecord attribute reader.
  #
  def method_missing(name, *args, &block)
    @attributes[name]
  end
end

##
# Reverse geocoded model.
#
class Landmark < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  def initialize(name, latitude, longitude)
    super()
    write_attribute :name, name
    write_attribute :latitude, latitude
    write_attribute :longitude, longitude
  end

  ##
  # If method not found, assume it's an ActiveRecord attribute reader.
  #
  def method_missing(name, *args, &block)
    @attributes[name]
  end
end

class Test::Unit::TestCase
  def venue_params(abbrev)
    {
      :msg => ["Madison Square Garden", "4 Penn Plaza, New York, NY"]
    }[abbrev]
  end
end
