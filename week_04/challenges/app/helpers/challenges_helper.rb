module ChallengesHelper

	def challenge_errors
		if @challenge.errors.any?
			content_tag :ul do
				@challenge.errors.full_messages.collect do |error_msg|
					content_tag(:li, error_msg)
				end.join.html_safe
			end
		end
	end

	def challenges_found
		if !@challenges_found.blank?
			content_tag :ul do
				@challenges_found.collect do | challenge |
					content_tag :li do
						link_to(challenge.title, challenge_path(challenge)) \
						+ ' - ' + link_to('Edit', edit_challenge_path(challenge)) \
						+ ' ' + link_to('Delete', challenge_path(challenge), method: :delete, data: {confirm: 'Are you sure?'} )
					end
				end.join.html_safe
			end
		end
	end
	
end
