module ApplicationHelper
	def is_active?(link_path)
 		current_page?(link_path) ? "active" : ""
	end
	def sortable(column, title = nil)
    	title ||= column.titleize
    	css_class = column == sort_column ? "current #{sort_direction}" : nil
    	direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    	link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
