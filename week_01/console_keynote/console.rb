require './player.rb'

class Console

	def start(slides)
		@player = Player.new(slides)
		@player.commands[:next_slide].show_slide(0)
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
				#@player.next_slide()
				@player.commands[:next_slide].run
			when 'previous', 'p'
				#@player.previous_slide()
				@player.commands[:previous_slide].run
			when 'auto', 'a'
				#@player.automatic()
				@player.commands[:automatic].run
			else
			end
		end
	end

end