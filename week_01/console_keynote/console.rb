require 'terminfo'

class Console

	@@actual_slide = 0

	def start(slides)
		@slides = slides
		puts TermInfo.screen_size.inspect
		show_slide(@@actual_slide)
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
				next_slide()
			when 'previous', 'p'
				previous_slide()
			else
			end
		end
	end

	def next_slide
		if(@@actual_slide < @slides.count-1) then
			@@actual_slide += 1
			show_slide(@@actual_slide)
		end
	end

	def previous_slide()
		if(@@actual_slide > 0) then
			@@actual_slide -= 1
			show_slide(@@actual_slide)
		end
	end

	def show_slide(slide_number)
		puts @slides[slide_number].content
	end

end