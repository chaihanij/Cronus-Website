class Image < ActiveRecord::Base
	has_attached_file :imageFile, :styles => { :conver => "600x455" ,:medium => "300x200", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :imageFile, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence :imageFile
	validates_attachment_size :imageFile, :less_than => 5.megabytes
end
