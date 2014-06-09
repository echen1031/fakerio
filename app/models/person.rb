class Person < ActiveRecord::Base

  def initialize
    super
    self.email = Faker::Internet.email
    self.name = Faker::Name.name
    self.ip_address = Faker::Internet.ip_v4_address
    self.bio = Faker::Lorem.paragraph
    self.avatar = Faker::Avatar.image
    self.phone = Faker::PhoneNumber.cell_phone
    self.credit_card = Faker::Finance.credit_card
  end

end
