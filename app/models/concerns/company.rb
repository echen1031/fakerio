class Company

  attr_accessor :name, :slogan, :site, :customer_support

  def initialize
    self.name = [Faker::Company.name, Faker::Company.suffix].join(" ")
    self.slogan = Faker::Company.catch_phrase
    self.site = generate_site
    self.customer_support = Faker::PhoneNumber.phone_number
  end

  def generate_site
    ["www", self.name.downcase.gsub(" ", ""), Faker::Internet.domain_suffix].join(".")
  end

end
