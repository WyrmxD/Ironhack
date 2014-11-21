module ApplicationHelper

	def flash_message
		messages = flash.keys.map do | key |
			fl(key.to_sym)
		end
		messages.join.html_safe
	end

	def pagination_links
		tags = ''
		if @page !=1
			tags += link_to('← Anterior ', challenges_path(page: @page-1))
 		end

 		if @page < @num_pages
 			tags += link_to('Siguiente →', challenges_path(page: @page+1))
 		end
 		tags.html_safe
	end

	private
	def fl(type)
		content_tag :div, class: 'message alert' do
 			content_tag :p do
 				flash[type]
 			end
 		end
	end

end
