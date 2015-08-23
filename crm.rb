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
		puts "Which contact to modify?"
		puts "Enter ID#: "
		input_id = gets.chomp
		input_id = input_id.to_i
		puts "Select attribute to modify"
		puts "1 for first name"
		puts "2 for last name"
		puts "3 for email"
		puts "4 for notes"
		att_to_modify = gets.chomp.to_i
		puts "Enter new value:"
		new_att_value = gets.chomp

		case att_to_modify
		when att_to_modify == 1
			att_to_modify = :fname
		when att_to_modify == 2
			att_to_modify = :lname
		when att_to_modify == 3
			att_to_modify = :email
		when att_to_modify = 4
			att_to_modify = :notes
		else
			"Invalid input!"
			modify_contact
		end # case

		selected_contact = @rolodex.modify_contact(input_id, att_to_modify, new_att_value)
			if selected_contact != nil
				puts "Contact #{selected_contact.id} modified!"
				display_single_contact(selected_contact)
			else
				puts "Contact not found!"
			end # if selected_contact
	end # def modify_contact

	def display_all_contacts
		puts "Display all contacts"
		@rolodex.all.each do |contact|
			display_single_contact(contact)
		end
	end # def display_all_contacts

	def display_single_contact(contact_info)
		print "\nID #: #{contact_info.id} "
		print "#{contact_info.lname}, #{contact_info.fname}. "
		print "Email: #{contact_info.email}"
		print "\n--Notes:"
		print "\n -#{contact_info.notes}"
	end # def display_single_contact

	def display_contact
		puts "Display contact"
		puts "Which contact to display?"
		puts "Enter ID#: "
		input_id = gets.chomp
		input_id = input_id.to_i
		selected_contact = @rolodex.select(input_id)
			if selected_contact != nil
				display_single_contact(selected_contact)
			else
				puts "Contact not found!"
			end # if selected_contact
	end # display_contact

	def display_contact_attribute
		puts "Display contact attribute"
		puts "Which contact to display?"
		puts "Enter ID#: "
		input_id = gets.chomp
		input_id = input_id.to_i
		puts "Select attribute to display"
		puts "1 for first name"
		puts "2 for last name"
		puts "3 for email"
		puts "4 for notes"
		att_to_display = gets.chomp.to_i
		requested_att = @rolodex.display_attribute(input_id, att_to_display)
			if requested_att != nil
				puts "#{requested_att}"
			else
				puts "Contact not found!"
			end # if selected_contact
	end # display_contact_attribute

	def delete_a_contact
		puts "Delete contact"
		puts "Which contact to delete?"
		puts "Enter ID#: "
		input_id = gets.chomp
		input_id = input_id.to_i
		selected_contact = @rolodex.delete_contact(input_id)
			if selected_contact != nil
				puts "Contact #{selected_contact.id} deleted!"
			else
				puts "Contact not found! Nothing deleted."
			end # if selected_contact
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