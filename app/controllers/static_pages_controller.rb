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
      @products = Product.is_public.order(:name => :asc)
    end
    def contact
      @contact = Contact.new
    end
    def event
      @events = Event.is_public
                  .search(params[:search])
                  .order(:created_at => :desc)
                  .page(params[:page])
                  .per(25)
    end

    def announcement
      @announcements = Announcement.is_public
                        .search(params[:search])
                        .order(:created_at => :desc)
                        .page(params[:page])
                        .per(25)
    end
    def wiki
      @wikis = Wiki.is_public
              .search(params[:search])
              .order(:created_at => :desc)
              .page(params[:page])
              .per(25)
    end

    def document
      @products = Product.is_public.order(:name => :asc)
    end

    def newdownloads
      @products = Product.is_public.order(:name => :asc)
    end

    def unauthorized_page
      @announcement_limit_five = Announcement.limit_five
      @events_limit_five = Event.limit_five
      @wikis = Wiki.limit_five
      @products = Product.limit_five
    end
end
