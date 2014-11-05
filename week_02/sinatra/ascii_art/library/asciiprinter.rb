require 'artii'

class Asciiprinter

	def convert_to_ascii(word)

		arti = Artii::Base.new
		arti.asciify(word)
	end

end