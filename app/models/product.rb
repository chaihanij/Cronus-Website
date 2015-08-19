class Product < ActiveRecord::Base
	validates :name, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed", minimum: 2, too_short: "%{count} characters is the minimum allowed" }
    validates :description, length: { maximum: 125, too_long: "%{count} characters is the maximum allowed" }

    extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :packages
    has_many :documents
    scope :limit_five, ->(){ limit(5).order(created_at: :desc) }
    scope :is_public, -> { where(:public => 1) }

    def self.search(search)
        if search
            where(['lower(name) LIKE ? OR lower(description) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
        else
            all
        end
    end

    

    # find the lasted package
    def lastest_package_release
    	self.packages.where(:latest => 1).order(:release_date => :desc).first
    end
end
