class Package < ActiveRecord::Base
  belongs_to :product
  belongs_to :operating_system
  
  has_attached_file :package, :use_timestamp => false, :preserve_files => "true"
  validates_attachment_content_type :package, :content_type => [/\Aapplication\/.*\Z/, /\Aapplication\/x-rpm/, /application\/x-rpm/, /\Application\/octet-stream/  ]
  # validates_attachment_presence :documnet
  validates_attachment_size :package, :less_than => 100.megabytes 

  has_attached_file :release_note, :use_timestamp => false
  validates_attachment_content_type :release_note, :content_type => [/\Aimage\/.*\Z/, /\Avideo\/.*\Z/, /\Aaudio\/.*\Z/, /\Aapplication\/.*\Z/]
  # validates_attachment_presence :documnet
  validates_attachment_size :release_note, :less_than => 100.megabytes

  # scope :current_package, ->(product_id){ where(:product_id => product_id).where(:release_package => true).order(:created_at => :desc).limit(1).first } 
  def self.search(search)
    if search
      where(['lower(name) LIKE ? OR lower(version) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
    else
      all
    end
  end
end
