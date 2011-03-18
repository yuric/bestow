# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails-geocoder}
  s.version = "0.9.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alex Reisner"]
  s.date = %q{2011-01-31}
  s.description = %q{Geocoder adds object geocoding and distance calculations to ActiveRecord models. It does not rely on proprietary database functions so finding geocoded objects in a given area is easily done using out-of-the-box MySQL, PostgreSQL, or SQLite.}
  s.email = ["alex@alexreisner.com"]
  s.files = ["lib/geocoder.rb", "lib/geocoder/lookup.rb", "lib/geocoder/calculations.rb", "lib/geocoder/active_record.rb", "test/test_helper.rb", "test/geocoder_test.rb", "CHANGELOG.rdoc", "Rakefile", "README.rdoc", "LICENSE"]
  s.homepage = %q{http://github.com/alexreisner/geocoder}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{Simple, database-agnostic geocoding and distance calculations for Rails.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
