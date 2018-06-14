class Recipe

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    self.all.max_by { |recipe| recipe.users.count }
  end

  def add_ingredients(arr)
    arr.each { |ingredient| RecipeIngredient.new(self, ingredient) }
  end

  def allergens
    allergens = Allergen.all.select { |allergen| self.ingredients.include?(allergen.ingredient) }
    allergens.map { |allergen| allergen.ingredient }
  end

  def ingredients
    recipe_ings = RecipeIngredient.all.select{ |ingredient| ingredient.recipe == self }
    recipe_ings.map { |recipe_ing| recipe_ing.ingredient }
  end

  def users
    cards = RecipeCard.all.select { |card| card.recipe == self }
    cards.map { |card| card.user }
  end
  
end
