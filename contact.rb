
class Contact
@@all_contacts = []
@@id = 1
attr_accessor :first_name, :last_name, :email, :notes, :id


  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, notes = nil)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
    @id = @@id
    @@all_contacts << self
    @@id += 1
  end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, notes = nil)
    x = Contact.new(first_name, last_name, email, notes)
    @@all_contacts << x
  end

  # This method should return all of the existing contacts
  def self.all
    @@all_contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@all_contacts = []
  end

  def full_name
    p "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end

# tyler = Contact.new('Tyler', 'Teng', 'tyler@gmail.com')
# edwin = Contact.new('Edwin', 'Lo', 'edwin@gmail.com')

# p tyler.first_name
# # p Contact.all
