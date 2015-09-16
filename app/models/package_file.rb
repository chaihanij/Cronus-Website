class PackageFile < ActiveRecord::Base
  extend FriendlyId
  friendly_id :package_file_name, use: :slugged
  
  belongs_to :product
  belongs_to :version
  belongs_to :operating_system  
  has_attached_file :package, :use_timestamp => false, :preserve_files => "true"
  validates_attachment_content_type :package, :content_type => [/\Aapplication\/.*\Z/, /\Aapplication\/x-rpm/, /application\/x-rpm/, /\Application\/octet-stream/ ]
  validates_attachment_size :package, :less_than => 100.megabytes 
  validates :description, length: { maximum: 255, too_long: "%{count} characters is the maximum allowed" }

  # Query 
  scope :is_public, -> { where(:is_public => 1) }
  scope :last_updated, -> { limit(10).order(:updated_at => :desc) } 
  # Function Qeruy
  def self.search(search)
    if search
      where(['lower(package_file_name) LIKE ?', "%#{search.strip.downcase}%"])
    else
      all
    end
  end
end
