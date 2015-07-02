class Event < ActiveRecord::Base
	has_attached_file :image, :styles => { :cover => "600x455", :medium => "290x220", :thumb => "100x100" }, :default_url => "/images/Event/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  	scope :limit_six, -> { order(:updated_at => :desc).limit(6) }

  	def self.limit_eight
  		limit(8).order(updated_at: :desc)
  	end
  	
  	def self.limit_five
    	limit(5).order(updated_at: :desc)
 	end

 	def self.search(search)
  		if search
        where(['lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
  		else
    		all
  		end
	end
end
