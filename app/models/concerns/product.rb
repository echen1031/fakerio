class Product
  attr_accessor :color, :price, :name, :department, :image

  def initialize
    self.color = Faker::Commerce.color
    self.price = Faker::Commerce.price
    self.name = Faker::Commerce.product_name
    self.department = Faker::Commerce.department
    self.image = "http://lorempixel.com/g/600/600/"
  end
end
