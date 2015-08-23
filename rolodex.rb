require_relative './contact.rb'

class Rolodex
	@@id = 1000

	def initialize
		@contacts = []
	end # initialize

	def add_contact(fname, lname, email, notes)
		contact = Contact.new(@@id, fname, lname, email, notes)
		@@id += 1

		@contacts << contact
	end # def add_contact

	def all
		@contacts
	end # def all

	def search(search_input)

		# DEBUG
		puts "Searchinput to i #{search_input.to_i}"

		@contacts.each do |search_name|
			# DEBUG
			puts "Searchname id #{search_name.id}"

			if search_name.id == search_input.to_i
				puts "Contact found!"
				puts "#{search_name.id} being returned" # DEBUG
				found_contact = search_name
			else
			end # case search_name
		end # @contacts.each
		return found_contact
	end # def search

end # class Rolodex