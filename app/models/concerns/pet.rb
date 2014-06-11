class Pet
  attr_accessor :name, :kind, :age

  def initialize
    self.name  = Faker::Name.first_name
    self.kind = Faker::Team.creature.singularize
    self.age = rand(14) + 1
  end
end
