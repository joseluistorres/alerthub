class Location < ActiveRecord::Base
	has_many :alertlocations
	has_many :alerts, through: :alertlocations
end
