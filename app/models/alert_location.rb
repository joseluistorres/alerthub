class AlertLocation < ActiveRecord::Base
	belongs_to :alert
	belongs_to :location
end
