require './file_reader.rb'
require './file_writer.rb'
require './slide.rb'
require './console.rb'

class Keynote
	
	def initialize(reader, writer)
		@reader = reader
		@writer = writer
		@slides = []
		@console = Console.new()
		load_slides()
	end
	
	def load_slides
		slides_readed = @reader.get_fragmented_lines
		slide_num = 1
		slides_readed.each do | slide_text |
			@slides.push( Slide.new(slide_num, slide_text) )
			slide_num += 1
		end
	end

	def start
		# run console
		@console.start(@slides)
	end
	
end

f_reader = File_reader.new("my_presentation.txt")
f_writer = File_writer.new("my_presentation.txt")
knote = Keynote.new(f_reader, f_writer)
knote.start