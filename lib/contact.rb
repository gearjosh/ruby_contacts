class Contact
  attr_reader :first_name, :last_name, :addresses, :phone_numbers, :id
  attr_accessor :job_title, :company

  @@contacts = {}

  def initialize(attributes)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title) || ''
    @company = attributes.fetch(:company) || ''
    @id = @last_name + @first_name.chars[0..2].join
    @addresses = [],
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
end
