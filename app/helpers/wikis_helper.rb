module WikisHelper
	def nested_attributes(attributes)
    	content_tag :ul, :class => 'tree' do
        	attributes.each do |attribute|
            	concat(
            		content_tag(:li) do 
            			raw(
            			   content_tag(:b,link_to(attribute.title , attribute )) 	
               		)
            		end
            	)
            		if ! attribute.child? 
                		concat(nested_attributes(attribute.children))
           		end
        	end
    	end
 	end

  def list_by_root(root)
      output="<ul><li>"
      output << "#{link_to(root.title, root)}</li>"
      for x in root.children
         output << list_by_root(x)
      end 
      output << "</ul>"
  end

  def list_by_root_a(root)
    output="<ul class=\"tree\"><li>"
      output << "#{link_to(root.title, root)}</li>"
      for x in root.children
         output << list_by_root(x)
      end 
      output << "</ul>"
  end
  
end
