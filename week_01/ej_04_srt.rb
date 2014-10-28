class SRT

	def initialize(file_name)
		@fd = File.new(file_name)
		@segments = []
		@typos = []
		@ignored_words = []
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
				elsif (segment.start_time.empty?) then
					# add times
					time = line.split(' --> ')
					segment.start_time = time[0]
					segment.end_time = time[1]
				else
					# add strings
					segment.string << "#{line} "
				end
			end			
		end
		@segments.push(segment)
		puts "#{@segments.size} segments readed"

	end

	def correct_time(time_ms)
		@segments.each do |segment|
			segment.start_time = miliseconds_to_string( string_to_miliseconds(segment.start_time) + time_ms )
			segment.end_time = miliseconds_to_string( string_to_miliseconds(segment.end_time) + time_ms )
		end
	end

	def string_to_miliseconds(time_string)
		t_parts = time_string.gsub(/,/,':').split(':')
		t_hours = t_parts[0].to_i
		t_minutes = t_parts[1].to_i
		t_seconds = t_parts[2].to_i
		t_mseconds = t_parts[3].to_i 

		t_total = t_mseconds + t_seconds * 1000 + t_minutes * 60 * 1000 + t_hours * 3600 * 1000
	end

	def miliseconds_to_string(time_ms)
		mseconds = time_ms % 1000
		x = time_ms / 1000
		seconds = x % 60
		x /= 60
		minutes = x % 60
		x /= 60
		hours = x % 24

		if(hours.to_s.size < 2) then
			hours = "0#{hours}"
		end

		if(minutes.to_s.size < 2) then
			minutes = "0#{minutes}"
		end

		if(seconds.to_s.size < 2) then
			seconds = "0#{seconds}"
		end

		if(mseconds.to_s.size < 2) then
			mseconds = "00#{mseconds}"
		elsif(mseconds.to_s.size < 3) then
			mseconds = "0#{mseconds}"
		end
		
		return "#{hours}:#{minutes}:#{seconds},#{mseconds}"
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
			segment_word_list.each do | word |
				if ( !@@dictionary.include?(word.downcase) && !is_ignored_word(word) ) then
					search_in_typos(word, segment.start_time)
				end
			end
		end 
	end

	def search_in_typos(word, segment_time)
		found = false
		@typos.each do | readed_typo |
			if (readed_typo.word == word) then
				readed_typo.times.push(segment_time)
				found = true
			end
		end

		if !found then
			typo = Typo.new(word)
			typo.times.push(segment_time)
			@typos.push(typo)
		end
	end

	def print_typos
		@typos.each do | typo |
			typo.describe
		end
	end

	def censor
		@segments.each do |segment|
			t_parts = segment.start_time.gsub(/,/,':').split(':')
			t_hours = t_parts[0].to_i
			minutes = t_parts[1].to_i + t_hours * 60
			if(minutes <= 30) then
				segment.string = segment.string.downcase.gsub(/[fuck]/,'CENSORED')
			end
		end
	end

	def is_ignored_word(word)
		if(@ignored_words.empty?) then
			return false
		end
		return @ignored_words.include?(word)
	end

	def add_ignored_word(word)
		@ignored_words.push(word)
	end

	private :read_file, :string_to_miliseconds, :miliseconds_to_string
	private :create_dictionary

end

class Segment

	attr_accessor :number
	attr_accessor :start_time
	attr_accessor :end_time
	attr_accessor :string

	def initialize()
		@number = 0
		@start_time = ""
		@end_time = ""
		@string = ""
	end

	def describe
		puts "##{@number}:"
		puts " start: #{@start_time} end: #{@end_time}"
		puts " string: "
		puts "   #{@string}"
	end 
end

class Typo

	attr_accessor :times
	attr_accessor :word

	def initialize(word)
		@word = word
		@times = []
	end

	def describe
		puts "word: #{@word}"
		@times.each do | time |
			puts " time: #{time}"
		end
	end
end

srt = SRT.new("sub.srt")
srt.correct_time(2500)
srt.add_ignored_word('Alex')
srt.add_ignored_word('Mary')
srt.find_typos
srt.print_typos
srt.censor