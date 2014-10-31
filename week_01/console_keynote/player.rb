require 'terminfo'

class Player

	attr_reader :commands
	
	def initialize(slides)
		@slides = slides
		@current_slide = 0
		@commands = {
			:next_slide => NextCommand.new(@slides),
			:previous_slide => PreviousCommand.new(@slides),
			:automatic => AutommaticCommand.new(@slides),
			:show_slide => Command.new(@slides)
		}
	end
	
end

class Command
	def initialize(slides)
		@slides = slides
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
		
		puts "[slide ##{slide_number+1}/#{@slides.count}]"
	end

	def print_slide_content(slide_text, terminal_width)
		slide_text.split("\n").each do | text_line |
			left_margin = (terminal_width - text_line.size) / 2
			puts " " * left_margin + text_line.gsub("\n","\n" + " " * left_margin)
		end
	end

	def print_blanks(num)
		print "\n" * num
	end
end

class NextCommand < Command
	
	def initialize(slides)
		super(slides)
	end
	
	def run(current_slide)
		if(current_slide < @slides.count-1) then
			current_slide += 1
		end
		show_slide(current_slide)
		
		return current_slide
	end	

end

class PreviousCommand < Command
	def initialize(slides)
		super(slides)
	end

	def run(current_slide)
		if(current_slide > 0) then
			current_slide -= 1
		end
		show_slide(current_slide)
		
		return current_slide
	end	
	
end

class AutommaticCommand < Command
	def initialize(slides)
		super(slides)
		@waitting_seconds = 3
	end

	def run(current_slide)
		for i in current_slide..@slides.count-1 do
			current_slide = i
			show_slide(current_slide)
			sleep(@waitting_seconds)
		end
		
		return current_slide
	end
end