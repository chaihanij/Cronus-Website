xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
	xml.channel do
		xml.title "Announcements"
    	xml.author "system platform development team"
    	xml.language "en"
    	for announcement in @announcements
    	end
    end
end