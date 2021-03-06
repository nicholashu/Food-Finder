class Restaurant

	@@filepath = nil 

	def self.filepath=(path=nil)
		@@filepath = File.join(APP_ROOT, path)
	end
	#checks if restaurant file exists
	def self.file_exists?
		#class should know if the restaurant file file_exists
		if @@filepath && File.exists?(@@filepath)
			return true
		else
			return false
		end
	end

	#boolean tests for useable restaurant file, better than file_exists?
	def self.file_useable?
 		return false unless @@filepath
 		return false unless File.exists?(@@filepath)
 		return false unless File.readable?(@@filepath)
 		#writable not writeable!!!!
 		return false unless File.writable?(@@filepath)
 		return true
	end	


	def self.create_file
		#create the restaurant file
		File.open(@@filepath, 'w') unless file_exists?
		return file_useable?
	end

	def self.saved_restaurants
		#read the restaurant file
		#return instances of restaurant
	end
end