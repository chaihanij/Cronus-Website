class Event < ActiveRecord::Base

	has_attached_file :image, :styles => { :cover => "600x455", :medium => "290x220", :thumb => "100x100" }, :default_url => "/images/Event/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :title, length: { maximum: 80, too_long: "%{count} characters is the maximum allowed", minimum: 2, too_short: "%{count} characters is the minimum allowed" }
  validates :description, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }
  validates :body, length: { maximum: 65535, too_long: "%{count} characters is the maximum allowed" }



  scope :limit_six, -> { where(:is_public => 1).order(:updated_at => :desc).limit(6) }

  def self.limit_eight
  	where(:is_public => 1).limit(8).order(updated_at: :desc)
  end
  	
  def self.limit_five
    where(:is_public => 1).limit(5).order(updated_at: :desc)
 	end

 	def self.search(search)
  		if search
        where(['lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
  		else
    		all
  		end
	end

  def self.is_public
    where(:is_public => 1)
  end

end
