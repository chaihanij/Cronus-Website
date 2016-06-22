class ApplicationController < ActionController::Base
  impressionist
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :set_product

  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to unauthorized_url, :alert => exception.message
  end


  private
  def set_product
    @products_nav = Product.all
  end


end
