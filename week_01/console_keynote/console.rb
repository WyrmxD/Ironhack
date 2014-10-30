require './player.rb'

class Console

	def start(slides)
		# @slides = slides
		# @actual_slide = 0
		@player = Player.new(slides)
		@player.show_slide(0)
		read_command()
	end

	def read_command

		loop do |variable|
			print "> "
			command = gets.chomp
			case command.downcase
			when 'quit', 'q'
				break
			when 'next', 'n'
				@player.next_slide()
			when 'previous', 'p'
				@player.previous_slide()
			when 'auto', 'a'
				@player.automatic()
			else
			end
		end
	end

end