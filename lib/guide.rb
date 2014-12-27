require 'restaurant'
class Guide

	def initialize(path=nil)
		#locate the restaurant text file to path
		Restaurant.filepath = path
		if Restaurant.file_useable?
			puts "\nRestaurant file found."
		#or create a new file
		elsif Restaurant.create_file
			puts "\nCreted new restaurant file"
		#exit if create fails
		else
			puts "Exiting. \n\n"
			exit!
		end
	end

	def launch!
		introduction
		#action loop
		loop do
			# => what do you want to do? (list, find, add, quit)
			print "> "
			user_response = gets.chomp
			#do that action
			result = do_action(user_response)
			#repeat until user_response equal to (==) quit
			break if result == :quit
		end
		conclusion
	end

	def introduction
		puts "\n\n<<<<< Welcome to the Food Finder >>>>>>\n\n"
		puts "This is an interactive guide to help you find the food you crave.\n\n"
	end

	def do_action(action)
		case action
		when 'list'
			puts "listing..."
		when 'find'
			puts "finding..."
		when 'add'
			puts "adding..."
		when 'quit'
			return :quit
		else
			puts "\n I don't understand"
		end


	end


	def conclusion
		puts "\n<<<<<< Goodbye and Bon Apitito >>>>>>\n\n\n"
	end
end
