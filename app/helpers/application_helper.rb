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

  def absolute_attachment_url(attachment_name, attachment_style = :original)
    "#{request.protocol}#{request.host_with_port}#{attachment_name.url(attachment_style)}"
  end

  def format_mb(size)
    conv = [ 'b', 'kb', 'mb', 'gb', 'tb', 'pb', 'eb' ];
    scale = 1024;
    ndx=1
    if( size < 2*(scale**ndx)  ) then
       return "#{(size)} #{conv[ndx-1]}"
    end
    size=size.to_f
    [2,3,4,5,6,7].each do |ndx|
      if( size < 2*(scale**ndx)  ) then
        return "#{'%.3f' % (size/(scale**(ndx-1)))} #{conv[ndx-1]}"
      end
    end
    ndx=7
    return "#{'%.3f' % (size/(scale**(ndx-1)))} #{conv[ndx-1]}"
  end
end
