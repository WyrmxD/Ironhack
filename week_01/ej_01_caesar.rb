class Crypto

	CAESAR_SHIFT = 3

	def self.caesar(msg, shift=CAESAR_SHIFT)
		coded_msg = ""
		(0..msg.size-1).each do |i|
			coded_msg << msg[i].ord + shift
		end
		return coded_msg
	end

end
puts "Write message:"
plain_msg = gets.chomp
caesar_msg = Crypto.caesar(plain_msg)
puts "#{plain_msg} -> #{caesar_msg}"
caesar_msg = Crypto.caesar(plain_msg, 1)
puts "#{plain_msg} -> #{caesar_msg}"