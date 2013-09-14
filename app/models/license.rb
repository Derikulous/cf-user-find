class License < ActiveRecord::Base
  has_one :user
  validates_length_of :state, :is => 2
end
