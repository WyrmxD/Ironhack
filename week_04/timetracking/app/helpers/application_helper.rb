module ApplicationHelper
	
	def flash_message
		messages = flash.keys.map do | key |
			fl(key.to_sym)
		end
		messages.join.html_safe
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
