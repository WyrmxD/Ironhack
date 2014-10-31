require './player.rb'

class Console

	def start(slides)
		@current_slide = 0
		@player = Player.new(slides)
		@player.commands[:next_slide].show_slide(@current_slide)
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
				@current_slide = @player.commands[:next_slide].run(@current_slide)
			when 'previous', 'p'
				@current_slide = @player.commands[:previous_slide].run(@current_slide)
			when 'auto', 'a'
				@current_slide = @player.commands[:automatic].run(@current_slide)
			else
			end
		end
	end

end