#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title "Announcements"
    	xml.author "sandequinoxteam@ais.co.th"
    	xml.description "System platform development team, Announcement"
    	xml.link "http://10.239.129.153:8090"
    	xml.language "en"
    	for annoncement in @announcements
    		xml.item do
    			if annoncement.title
          			xml.title annoncement.title
        		else
          			xml.title ""
        		end
        		#xml.description annoncement.description
        		xml.description annoncement.body
    		end
    	end
	end
end
