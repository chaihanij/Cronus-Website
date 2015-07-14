module WikisHelper
	def nested_attributes(attributes)
    	content_tag(:ul, :class => 'tree') do
        	attributes.each do |attribute|
            	concat(
            		content_tag(:li) do 
            			raw(
            			  content_tag(:div) do
                      concat content_tag(:i,link_to(attribute.title , attribute))  
                    end   
               		)
            		end
            	)
            		if ! attribute.child? 
                		concat(nested_attributes_b(attribute.children))
           		end
        	end
    	end
 	end
  def nested_attributes_b(attributes)
      content_tag :ul, :class => 'tree' do
          attributes.each do |attribute|
              concat(
                content_tag(:li) do 
                  raw(
                    content_tag(:div) do
                      concat content_tag(:i,link_to(attribute.title , attribute))  
                    end   
                  )
                end
              )
                if ! attribute.child? 
                    concat(nested_attributes_b(attribute.children))
              end
          end
      end
  end

  def list_by_root(root)
      output="<ul>"
      output << "<li><div><b>#{link_to(root.title, root)}</b></div></li>"
      for x in root.children
         output << list_by_root(x)
      end 
      output << "</ul>"
  end

  def list_by_root_a(root)
    output="<ul class=\"tree\">"
    output << "<li><div><b>#{link_to(root.title, root)}</b></div></li>"
      for x in root.children
         output << list_by_root(x)
      end 
      output << "</ul>"
  end
  def list_by_root_b(root)
    output="<ul>"
    output << "<li><div><b>#{link_to(root.title, root)}</b></div></li>"
      for x in root.children
         output << list_by_root_b(x)
      end 
      output << "</ul>"
  end

end
 