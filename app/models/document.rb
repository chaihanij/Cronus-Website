class Document < ActiveRecord::Base
  #specify that the resume is a paperclip file attachment
  has_attached_file :documnet, :use_timestamp => false
  validates_attachment_content_type :documnet, :content_type => [/\Aimage\/.*\Z/, /\Avideo\/.*\Z/, /\Aaudio\/.*\Z/, /\Aapplication\/.*\Z/]
  validates_attachment_presence :documnet
  validates_attachment_size :documnet, :less_than => 100.megabytes
end
