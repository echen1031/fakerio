require 'spec_helper'

describe Person do
  describe "Initialization" do
    it "should have a fake name, ip address, bio, avatar, phone, credit card" do
      person = Person.new
      expect(person.name).to_not be_blank
      expect(person.email).to_not be_blank
      expect(person.ip_address).to_not be_blank
      expect(person.bio).to_not be_blank
      expect(person.avatar).to_not be_blank
      expect(person.phone).to_not be_blank
      expect(person.credit_card).to_not be_blank
    end
  end
end
