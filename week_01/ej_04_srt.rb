class SRT

	def initialize(file_name)
		@fd = File.new(file_name)
		@segments = []
		@typos = []
		@profanity_filter = []
		read_file
		create_dictionary
	end

	def read_file
		if @fd.nil? then 
			return 
		end

		segment = Segment.new()
		while !@fd.eof? do
			line = @fd.readline.chomp
			if(line.empty?) then
				@segments.push(segment)
				segment = Segment.new()
			else
				if (segment.number == 0) then
					# add sequence
					segment.number = line.to_i
				elsif (segment.time_start.empty?) then
					# add times
					time = line.split(' --> ')
					segment.time_start = time[0]
					segment.time_end = time[1]
				else
					# add strings
					segment.string << line
				end
			end			
		end
		@segments.push(segment)
		puts "#{@segments.size} segments readed"

	end

	def correct_time(time_ms)
		@segments.each do |segment|
			#  00:42:40,138
			segment.time_start = segment.time_start.gsub(/,/,'').slice(6,5).to_i + time_ms
			segment.time_end = segment.time_end.gsub(/,/,'').slice(6,5).to_i + time_ms
		end
	end

	def create_dictionary
		fd_dictionary = File.new('/usr/share/dict/words')
		@@dictionary = fd_dictionary.readlines
		@@dictionary.each do | word |
			word.chomp!
		end
		puts "#{@@dictionary.size} words in the dictionary"
	end

	def find_typos
		@segments.each do | segment |
			clean_string = segment.string.gsub(/[\.,;:!\?]/,'')
			segment_word_list = clean_string.gsub(/<\/?i>/,'').split
			puts segment_word_list.inspect
		end 
	end


end

class Segment

	attr_accessor :number
	attr_accessor :time_start
	attr_accessor :time_end
	attr_accessor :string

	def initialize()
		@number = 0
		@time_start = ""
		@time_end = ""
		@string = ""
	end

	def describe
		puts "##{@number}:"
		puts " start: #{@time_start} end: #{@time_end}"
		puts " string: "
		puts "   #{@string}"
	end 
end

srt = SRT.new("sub.srt")
srt.correct_time(2500)
srt.find_typos