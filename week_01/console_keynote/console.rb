require 'terminfo'

class Console

	@@actual_slide = 0

	def start(slides)
		@slides = slides
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
		end
		show_slide(@@actual_slide)
	end

	def previous_slide()
		if(@@actual_slide > 0) then
			@@actual_slide -= 1
		end
		show_slide(@@actual_slide)
	end

	def show_slide(slide_number)
		height, width = TermInfo.screen_size
		slide_text = @slides[slide_number].content

		num_text_lines = slide_text.split("\n").count
		num_blanks_before = (height.to_i - num_text_lines - 2 ) / 2
		num_blanks_after = ( (height.to_i - num_text_lines - 2 ) / 2.0 ).ceil

		for i in 1..(num_blanks_before) do
			puts 
		end
		slide_text.split("\n").each do | text_line |
			left_margin = (width - text_line.size) / 2
			puts " " * left_margin + text_line.gsub("\n","\n" + " " * left_margin)
		end
		
		for i in 1..(num_blanks_after) do
			puts 
		end
		puts "[slide ##{@@actual_slide+1}]"
	end

end