require_relative './rolodex.rb'


class CRM
	attr_accessor :crm_name

	def self.run(crm_name)
		crm = new(crm_name)
		crm.main_menu
	end # self.run

	def initialize(crm_name)
		@crm_name = crm_name
		@rolodex = Rolodex.new
	end # initialize

	def add_contact
		print "\nAdd contact"
		
		print "\nFirst name: "
		fname = gets.chomp
		
		print "Last name: "
		lname = gets.chomp
		
		print "Email: "
		email = gets.chomp
		
		print "Notes: "
		notes = gets.chomp

		@rolodex.add_contact(fname, lname, email, notes)

	end # def add_contact

	def modify_contact
		puts "Modify contact"
	end # def modify_contact

	def display_all_contacts
		puts "Display all contacts"
		@rolodex.all.each do |contact|
			display_single_contact(contact)
		end
	end # def display_all_contacts

	def display_single_contact(search_name)
		print "#{search_name.lname}, #{search_name.fname}"
		print "\n-- Email: #{search_name.email}"
		print "\n-- Notes:"
		print "\n  -#{search_name.notes}"
	end # def display_single_contact

	def display_contact
		puts "Display contact"
		puts "Which contact to display?"
		puts "Enter first name: "
		search_input = gets.chomp.downcase
		
		search_name = @rolodex.search(search_input)
		if search_name == nil
		print "Contact not found!"
			main_menu
		else
			display_single_contact(search_name)
		end
	end # display_contact

	def display_contact_attribute
		puts "Display contact attribute"
	end # display_contact_attribute

	def delete_a_contact
		puts "Delete contact"
	end # def delete_a_contact

	def exit
	end # def exit

	def print_main_menu

  		puts "\n1. Add a contact"
  		puts "2. Modify a contact"
  		puts "3. Display all contacts"
  		puts "4. Display contact"
  		puts "5. Display contact attribute"
  		puts "6. Delete a contact"
  		puts "7. Exit"

	end # def print_main_menu

	def main_menu

  		while true
  	  		print_main_menu
  	  		print "Choose an option: "
  	  		user_input = gets.chomp.to_i
  		break if user_input == 7
  	  		choose_option(user_input)
  		end

	end # def main_menu

	def choose_option(input)

		case input
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then display_contact
		when 5 then display_contact_attribute
		when 6 then delete_a_contact
		when 7 then exit
		else
			puts "I'm sorry Dave, I'm afraid you can't do that."
		end

	end # def choose_option

	# main_menu

end # class Contact

CRM.run("My CRM")