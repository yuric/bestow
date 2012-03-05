class Foocancan < ActiveRecord::Base
  validates :author, :body, :title, :presence => true
end
