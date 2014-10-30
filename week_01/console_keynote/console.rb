require 'terminfo'

class Console

	def start(slides)
		puts TermInfo.screen_size.inspect
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
			when 'previous', 'p'
			else
			end
		end

	end

	def next
	end

	def previous
	end

end