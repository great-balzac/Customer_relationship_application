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
	end # def delete_contact

	def modify_contact(id_num, att_to_modify, new_att_value)
		# Gets the correct_index number for the object
		# to have its attribute modified

		#correct_index = @contacts.index {|contact| contact.id == id_num}
		#selected_contact[:att_to_modify] = new_att_value
		#return @contacts(correct_index)

	end # def modify_contact

	def display_attribute(id_num, att_to_display)
		selected_contact = select(id_num)

	#puts att_to_display[:fname] #debug

		case att_to_display
		when att_to_display=1
			return selected_contact.fname
		when att_to_display=2
			return selected_contact.lname
		when att_to_display=3
			return selected_contact.email
		when att_to_display=4
			return selected_contact.notes
		else
		end # case

	end # display_attribute

end # class Rolodex