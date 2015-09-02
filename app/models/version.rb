class Version < ActiveRecord::Base
  
  belongs_to :product
  has_many :package_files

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed", minimum: 2, too_short: "%{count} characters is the minimum allowed" }
  validates :description, length: { maximum: 65535, too_long: "%{count} characters is the maximum allowed" }

  has_attached_file :release_note, :use_timestamp => false
  validates_attachment_content_type :release_note, :content_type => ["application/pdf"], :message => ', Only PDF files are allowed.'
  validates_attachment_size :release_note, :less_than => 100.megabytes


  scope :is_public, -> { where(:is_public => 1) }

  scope :latest_version, -> { where(:is_public => 1, :latest => 1) }
  scope :last_updated, -> { limit(10).order(:updated_at => :desc) } 
  scope :set_latest_all_false, -> { update_all(:latest => false) }
  scope :with_out_latest, -> (id){ where.not(:id => id) }
  scope :list_static_download, -> { where(:is_public => 1,:broken_version => false)}  


  def self.search(search)
    if search
        where(['lower(name) LIKE ?', "%#{search.strip.downcase}%"])
    else
        all
    end
  end

  def self.get_os(package_file)
    where(:id => package_file.id)
  end
end
