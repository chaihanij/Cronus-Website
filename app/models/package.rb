class Package < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

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

  validates :name, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed", minimum: 2, too_short: "%{count} characters is the minimum allowed" }
  validates :description, length: { maximum: 65535, too_long: "%{count} characters is the maximum allowed" }

  scope :is_public, -> { where(:public => 1) }
  scope :latest_package, -> { where(:latest => 1,:is_public => 1).order(:updated_at => :desc).first }
  # scope :current_package, ->(product_id){ where(:product_id => product_id).where(:release_package => true).order(:created_at => :desc).limit(1).first } 
  def self.search(search)
    if search
      where(['lower(name) LIKE ? OR lower(version) LIKE ?', "%#{search.strip.downcase}%", "%#{search.strip.downcase}%"])
    else
      all
    end
  end
end
