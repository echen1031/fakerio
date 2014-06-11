class Product
  attr_accessor :color, :price, :name, :department

  def initialize
    self.color = Faker::Commerce.color
    self.price = Faker::Commerce.price
    self.name = Faker::Commerce.product_name
    self.department = Faker::Commerce.department
  end
end
