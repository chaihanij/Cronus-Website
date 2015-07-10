class Announcement < ActiveRecord::Base
    has_attached_file :image, :styles => { :cover => "1400x730^", :medium => "616x293^", :thumb => "200x300^" }, convert_options: { thumb: " -gravity center -crop '100x100+0+0'", medium: " -gravity center -crop '616x293+0+0'", cover: " -gravity center -crop '1400x730+0+0'"}, :default_url => "/images/Announcement/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    
    validates :title, length: { maximum: 80, too_long: "%{count} characters is the maximum allowed", minimum: 2, too_short: "%{count} characters is the minimum allowed" }
    validates :description, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }
    validates :body, length: { maximum: 65535, too_long: "%{count} characters is the maximum allowed" }

    scope :limit_five, -> { limit(5).order(:updated_at => :desc) }
    scope :limit_tree, -> { limit(3).order(:updated_at => :desc) }  

    def self.search(search)
    		if search
      		where(['lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
    		else
      		all
    		end
  	end
    def self.new_update
      order(:updated_at => :desc)
    end 
    def self.is_public
       where(:is_public => 1)
    end
end
