require 'terminfo'

class Player
	
	def initialize(slides)
		@slides = slides
		@actual_slide = 0
	end

	def automatic

		for i in @actual_slide..@slides.count-1 do
			@actual_slide = i
			show_slide(@actual_slide)
			sleep(3)
		end
	end

	def next_slide
		if(@actual_slide < @slides.count-1) then
			@actual_slide += 1
		end
		show_slide(@actual_slide)
	end

	def previous_slide()
		if(@actual_slide > 0) then
			@actual_slide -= 1
		end
		show_slide(@actual_slide)
	end

	def show_slide(slide_number)
		terminal_height, terminal_width = TermInfo.screen_size
		slide_text = @slides[slide_number].content

		num_text_lines = slide_text.split("\n").count
		num_blanks_before = (terminal_height.to_i - num_text_lines - 2 ) / 2
		num_blanks_after = ( (terminal_height.to_i - num_text_lines - 2 ) / 2.0 ).ceil

		print_blanks(num_blanks_before)
		print_slide_content(slide_text, terminal_width)
		print_blanks(num_blanks_after)	
		
		puts "[slide ##{@actual_slide+1}/#{@slides.count}]"
	end

	def print_slide_content(slide_text, terminal_width)
		slide_text.split("\n").each do | text_line |
			left_margin = (terminal_width - text_line.size) / 2
			puts " " * left_margin + text_line.gsub("\n","\n" + " " * left_margin)
		end
	end

	def print_blanks(num)
		for i in 1..(num) do
			puts 
		end
	end
	
end