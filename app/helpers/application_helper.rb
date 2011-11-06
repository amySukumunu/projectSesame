module ApplicationHelper
	def title
		base_title ="Project Sesame"
		if @title.nil?
			"#{base_title}"
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def pagePic
	
		if @pagePic.nil?
			image_tag("pagePicDefault.jpg", :alt => "intro", :class => "round") 
		else
			image_tag(@pagePic, :alt => "Sample App", :class => "round") 
		end	
	end
	
	def whereAreYou 
		base="You're here: "
		if @title.nil?
			
		else
			%(You're here :  #{link_to(@title,request.fullpath)}).html_safe
			
	
		end
	end
end
