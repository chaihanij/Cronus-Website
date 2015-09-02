class OperatingSystem < ActiveRecord::Base
	
	has_many :package
    has_many :package_files

	validates :name, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
   	validates :version, length: { maximum: 20, too_long: "%{count} characters is the maximum allowed" }
    validates :description, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }

	scope :is_public, -> { where(:is_public => 1) }
end
