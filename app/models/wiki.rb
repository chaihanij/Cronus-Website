class Wiki < ActiveRecord::Base
  acts_as_nested_set
  accepts_nested_attributes_for :children

  scope :limit_five, -> { where(:is_public => 1).roots.limit(5).order(:updated_at => :desc) }

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
        roots
      end
  end

  def self.is_public
    where(:is_public => 1)
  end

end
