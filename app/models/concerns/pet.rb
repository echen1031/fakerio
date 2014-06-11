class Pet
  attr_accessor :name, :creature

  def initialize
    self.make_pet_singular
    self.creature = Faker::Team.creature
  end

  def make_pet_singular
    [Faker::Team.name.pluralize(1)]
  end
end
