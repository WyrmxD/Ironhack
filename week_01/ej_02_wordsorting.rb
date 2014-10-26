class WordSorting

	def self.sort(string)
		return string.downcase.gsub(/[\.,;]/, '').split.sort
	end
end

puts WordSorting.sort("este a es, un mensaje.")