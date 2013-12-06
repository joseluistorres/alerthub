class Alert < ActiveRecord::Base
	belongs_to :user
	has_many :alertlocations
	has_many :locations, through: :alertlocations
end
