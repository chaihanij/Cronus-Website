class Contact < ActiveRecord::Base

  	def self.search(search)
  		if search
    		where(['lower(name) LIKE ? OR lower(email) LIKE ? OR  lower(subject) LIKE ? OR lower(message) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%", "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
  		else
    		all
  		end
	end
end
