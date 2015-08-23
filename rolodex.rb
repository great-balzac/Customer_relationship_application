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

	def select(id_num)
		correct_index = @contacts.index {|contact| contact.id == id_num}
		return @contacts.fetch(correct_index)
	end # def search

	def delete_contact(id_num)
		correct_index = @contacts.index {|contact| contact.id == id_num}
		return @contacts.delete_at(correct_index)
	end

end # class Rolodex