class Document < ActiveRecord::Base
  has_attached_file :document, :use_timestamp => false
  validates_attachment_content_type :document, :content_type => [/\Aapplication\/.*\Z/, /.*\/.*/]
  validates_attachment_size :document, :less_than => 100.megabytes
end
