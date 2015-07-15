class Product < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	has_many :packages

    def self.search(search)
        if search
            where(['lower(name) LIKE ? OR lower(description) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
        else
            all
        end
    end

    scope :is_public, -> { where(:public => 1) }


	def self.limit_five
    	limit(5).order(created_at: :desc)
    end

    # find the lasted package
    def lastest_package_release
    	self.packages.latest_package
    end
end
