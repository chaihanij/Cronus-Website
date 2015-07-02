module WikisHelper
	def nested_attributes(attributes)
    	content_tag (:ul) do
        	attributes.each do |attribute|
            	concat(
            		content_tag(:li) do 
            			raw(
            			content_tag(:b,link_to(attribute.title , attribute)) + 
            			content_tag(:i,link_to('Edit', edit_wiki_path(attribute))) +
               			content_tag(:i,link_to('Delete', attribute, method: :delete, data: { confirm: 'Are you sure?' }))
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
end
