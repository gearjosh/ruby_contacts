class Contact
  attr_reader :first_name, :last_name, :addresses, :phone_numbers, :id
  attr_accessor :job_title, :company

  @@contacts = {}

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name).capitalize.strip
    @last_name = attributes.fetch(:last_name).capitalize.strip
    @job_title = attributes.fetch(:job_title).strip || ''
    @company = attributes.fetch(:company).strip || ''
    @id = @last_name + @first_name.chars[0..2].join
    @addresses = []
    @phone_numbers = []
  end

  def save
    @@contacts.store(@id, self)
  end

  def new_address(address_to_add)
    @addresses.push(address_to_add)
  end

  def new_phone_number(phone_num)
    @phone_numbers.push(phone_num)
  end

  def address_clear
    @addresses = []
  end

  def phone_clear
    @phone_numbers = []
  end

  def all_clear
    self.address_clear & self.phone_clear
  end

  def self.all
    @@contacts.values
  end

  def delete
    @@contacts.delete(self.id)
  end

  def self.find(id)
    @@contacts.fetch(id)
  end
end
