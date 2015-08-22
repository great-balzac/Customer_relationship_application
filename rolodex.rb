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
		found_contact = nil
		@contacts.each do |search_name|
			if search_name.fname.downcase == search_input
				"Contact found!"
				found_contact = search_name
			else
				found_contact = nil
			end # case search_name
		return found_contact
		end # @contacts.each

	end # def search

end # class Rolodex