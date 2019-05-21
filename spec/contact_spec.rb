require "pry"
require "contact"

describe 'Contact' do
  before(:each) do
    @hash = {
      first_name: 'Chazzie',
      last_name: 'Vizzlemammer',
      job_title: 'Second Story Man',
      company: 'Interesting Acquisitions, LLC'
    }
    @address = {
      street1: '123 Fake St',
      street2: 'Apt 4',
      city: 'Anytown',
      state: 'USA',
      zip: '00001'
    }
    @address2 = {
      street1: '567 Scrapankle Rd',
      street2: '2nd floor',
      city: 'Baconburg',
      state: 'New Jersey',
      zip: '00002'
    }
    @phone_number = '(503)246-6189'
    @phone_number2 = '(503)699-9959'
    @contact = Contact.new(@hash)
    @contact.all_clear
  end

  it "will create a  contact with the inputted first name" do
    expect(@contact.first_name).to(eq('Chazzie'))
  end

  it "will create a  contact with the inputted last name" do
    expect(@contact.last_name).to(eq('Vizzlemammer'))
  end

  it "will change a job_title to a new one" do
    @contact.job_title = 'Wet Blanket'
    expect(@contact.job_title).to(eq('Wet Blanket'))
  end

  describe '#new_address' do
    it "will add a new address to the contact" do
      @contact.new_address(@address)
      expect(@contact.addresses).to(eq([@address]))
    end

    it "will add multiple new addresses to the contact" do
      @contact.new_address(@address)
      @contact.new_address(@address2)
      expect(@contact.addresses).to(eq([@address, @address2]))
    end
  end

  describe '#new_phone_number' do
    it "will add a new phone number to the contact" do
      @contact.new_phone_number(@phone_number)
      expect(@contact.phone_numbers).to(eq([@phone_number]))
    end

    it "will add multiple new phone numbers to the contact" do
      @contact.new_phone_number(@phone_number)
      @contact.new_phone_number(@phone_number2)
      expect(@contact.phone_numbers).to(eq([@phone_number, @phone_number2]))
    end
  end

  describe '#save' do
    it "will save a contact to @@contacts" do
      @contact.save
      expect(Contact.all).to(eq([@contact]))
    end
  end

end
