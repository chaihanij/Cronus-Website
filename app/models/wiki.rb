class Wiki < ActiveRecord::Base

  validates :title, length: { maximum: 80, too_long: "%{count} characters is the maximum allowed", minimum: 2, too_short: "%{count} characters is the minimum allowed" }
  validates :description, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }
  validates :body, length: { maximum: 65535, too_long: "%{count} characters is the maximum allowed" }
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
        all
      end
  end

  def self.is_public
    where(:is_public => 1)
  end
  def self.order_parent
    order('coalesce(parent_id, id), parent_id is not null, id')
  end

  def self.collection_to_json(collection = roots)
    collection.inject([]) do |arr, wiki|
      arr << { id: wiki.id, tile: wiki.title, is_public: wiki.is_public, children: collection_to_json(wiki.children) }
    end
  end
 


  # scope :parents, -> { where(:parent_id => nil) }
  # scope :for_parent, -> { |parent| where(:parent_id => parent.id)}

  # def children
  #  Wiki.for_parent(self)
  # end


  # def self.parents_from_collection
  #   all.select { |k,v| k[:depth] == 0 }
  # end

  # def self.children_from_collection(parent)
  #   all.select { |k,v| k[:parent_id] == parent[:id] }
  # end

  # def self.collection_to_json(collection = false)
  #   collection ||= parents_from_collection

  #   collection.inject([]) do |arr, row|
  #     children = children_from_collection(row)

  #     arr << { id: row[:id], title: row[:title], is_public: row[:is_public], created_at: row[:created_at], updated_at: row[:updated_at], children: collection_to_json(children) }
  #   end
  # end


end
