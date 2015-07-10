class StaticPagesController < ApplicationController
  def home
  	@annNew = Announcement.is_public.limit_tree
  	@announcement_limit_five = Announcement.is_public.limit_five
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
  def event

  end 
  def announcement
    @announcements = Announcement.is_public.search(params[:search]).order(:updated_at => :desc).page(params[:page]).per(5)
  end

  def wiki
    @wikis = Wiki.search(params[:search]).order(:updated_at => :desc).page(params[:page]).per(5)
  end

  def unauthorized_page
  end
end
