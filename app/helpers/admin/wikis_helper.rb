module Admin::WikisHelper
	# def admin_nested_attributes(attributes)
 #    	content_tag (:ul) do
 #        	attributes.each do |attribute|
 #            	concat(
 #            		content_tag(:li) do 
 #            			raw(
 #            			content_tag(:b,link_to(attribute.title , admin_wiki_path(attribute) )) +  
 #            			content_tag(:i,link_to('Edit', edit_admin_wiki_path(attribute))) +
 #               			content_tag(:i,link_to('Delete', admin_wiki_path(attribute), method: :delete, data: { confirm: 'Are you sure?' }))
 #               			)
 #            		end
 #            	)
 #            		if ! attribute.child? 
 #                		concat(admin_nested_attributes(attribute.children))
 #           		end
 #        	end
 #    	end
 # 	end
    def tree_from_set(set)
        buf = ''    

        depth = -1
        set.each do |node|
            if node.depth > depth
                buf << "<ul><li>#{node.title}" 
            else
                buf << "</li></ul>" * (depth - node.depth)
                buf << "</li><li>#{node.title}"
            end 

            depth = node.depth
        end 

        buf << "</li></ul>" * (depth + 1)   

        buf.html_safe
    end
end
