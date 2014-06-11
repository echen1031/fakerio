class Pet
  attr_accessor :name, :creature

  def initialize
    self.creature = Faker::Team.creature.singularize
  end
end
