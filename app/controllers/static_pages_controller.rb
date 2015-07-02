class StaticPagesController < ApplicationController
  def home
  	@annNew = Announcement.limit_tree
  	@announcement_limit_five = Announcement.limit_five
		@events = Event.limit_six
		@events_limit_five = Event.limit_five
		@wikis = Wiki.limit_five
		@products = Product.limit_five
  end
  def download
  	@products = Product.is_public
  end
  def contact
    @contact = Contact.new
  end

  def unauthorized_page
  end
end
