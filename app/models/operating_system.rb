class OperatingSystem < ActiveRecord::Base
	has_many :package
	scope :is_public, -> { where(:is_public => 1) }
end
