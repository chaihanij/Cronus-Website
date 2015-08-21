class Document < ActiveRecord::Base

    belongs_to :product
    
    validates :name, length: { maximum: 80, too_long: "%{count} characters is the maximum allowed", minimum: 2, too_short: "%{count} characters is the minimum allowed" }
    validates :description, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }
    
    acts_as_nested_set
    accepts_nested_attributes_for :children

    has_attached_file :document, :use_timestamp => false
    validates_attachment_content_type :document, :content_type => ["application/pdf"], :message => ', Only PDF files are allowed.'
    validates_attachment_size :document, :less_than => 100.megabytes

    scope :is_public, -> { where(:is_public => 1) }
    
    scope :with_prodcut, -> (product_id){ where(:product_id => product_id).is_public }
    scope :last_document, -> (id){ where.not(:id => id).limit(5).order(:created_at => :desc).is_public }
    # scope :search, -> (search){ |search| ? where(['lower(name) LIKE ?', "%#{search.strip.downcase}%"]) : all }
    scope :last_updated, -> { limit(10).order(:updated_at => :desc) } 
    
    def self.search(search)
        if search
            where(['lower(name) LIKE ?', "%#{search.strip.downcase}%"])
        else
            all
        end
    end
end
