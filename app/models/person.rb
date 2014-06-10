class Person

  attr_accessor :email, :name, :ip_address, :bio, :avatar, :phone, :credit_card, :company

  def initialize(has_company = false)
    self.email = Faker::Internet.email
    self.name = Faker::Name.name
    self.ip_address = Faker::Internet.ip_v4_address
    self.bio = Faker::Lorem.paragraph
    self.avatar = Faker::Avatar.image(self.name_slug)
    self.phone = Faker::PhoneNumber.cell_phone
    self.credit_card = Faker::Finance.credit_card
    if has_company
      self.company = Company.new
    end
  end

  def name_slug
    self.name.parameterize
  end

end
