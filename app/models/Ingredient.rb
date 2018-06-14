
class Ingredient

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    array = Allergen.all.map { |allergen| allergen.ingredient }
    array.sort_by { |el| array.count(el) }.last
  end

end
