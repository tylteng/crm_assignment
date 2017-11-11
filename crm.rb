require_relative 'contact.rb'

class CRM
attr_accessor :contacts
  def initialize(name)
    puts "This CRM belongs to " + name
    @name
    @contacts = []
  end

  # def contact_list
  #   @contacts
  # end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all your contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then prompt_modify_existing_contact
      when 3 then prompt_id_to_delete
      when 4 then display_all_contacts
      when 5 then prompt_search_by_attribute
      when 6 then exit
    end
  end

  def add_new_contact
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    print 'Email: '
    email = gets.chomp
    print 'Note: '
    note = gets.chomp

    contact = Contact.new(first_name, last_name, email, note)
    @contacts << contact
    # print_main_menu
    main_menu
  end

  def prompt_modify_existing_contact
    print "ID: "
    contact_id = gets.chomp.to_i
    print "Attribute: "
    attribute = gets.chomp
    print "Value: "
    value = gets.chomp

    modify_existing_contact(contact_id, attribute, value)
  end

  def modify_existing_contact(contact_id, attribute, value)

    self.contacts.each do |x|
      if x.id == contact_id
        x.send(attribute+'=',value)
      end
    end
  end

  def prompt_id_to_delete
    print "Please enter ID: "
    x = gets.chomp.to_i

    delete_contact(x)
  end

  def delete_contact(contact_id)
    self.contacts.each do |x|
      if x.id == contact_id
        self.contacts.delete(x)
      end
    end
  end

  def display_all_contacts
    self.contacts.each do |x|
        p "#{x.first_name} #{x.last_name}, email: #{x.email}, id: #{x.id}"
      #p x
    end
  end

  def prompt_search_by_attribute
    print "Attribute: "
    attribute = gets.chomp
    print "Value: "
    value = gets.chomp

    search_by_attribute(attribute, value)
  end

  def search_by_attribute(attribute, value)
    #long way
    # if attribute == "first_name"
    #   self.contacts.each do |x|
    #     if value == x.first_name
    #       p x
    #     end
    #   end
    # elsif attribute == "last_name"
    #   self.contacts.each do |x|
    #     if value == x.last_name
    #       p x
    #     end
    #   end
    # elsif attribute == "email"
    #   self.contacts.each do |x|
    #     if value == x.email
    #       p x
    #     end
    #   end
    # end
# short way (send method)
    self.contacts.each do |x|
      if x.send(attribute) == value
        print x
      end
    end
  end
end
tyler_crm = CRM.new('Tyler')
tyler_crm.main_menu
# Contact.create('Tyler', 'Teng', 'tyler@gmail.com')
# tyler_crm.add_new_contact
#
# Contact.create('Edwin', 'Lo', 'edwin@gmail.com')
# tyler_crm.modify_existing_contact(1, "email", "teng@email.com")
#
# # tyler_crm.delete_contact(1)
#
# # tyler_crm.search_by_attribute("email", "edwin@gmail.com")
 # tyler_crm.display_all_contacts
# # tyler_crm.add_new_contact(tyler)
#
# p tyler_crm.contacts
