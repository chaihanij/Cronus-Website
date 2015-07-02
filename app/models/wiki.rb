class Wiki < ActiveRecord::Base
  acts_as_nested_set
  accepts_nested_attributes_for :children

  scope :limit_five, -> { roots.limit(5).order(:updated_at => :desc) }

  def self.search(search)
  		if search
    		where(['lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
  		else
    		roots
  		end
	end
   def self.searchAll(search)
      if search
        where(['lower(title) LIKE ? OR lower(description) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
      else
        all
      end
  end
end
