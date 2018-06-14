class User

  attr_accessor :name
  
  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    Recipe.all.select { |recipe| recipe.users.include?(self) }
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(user: self, date: date, rating: rating, recipe: recipe)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select { |allergen| allergen.user == self }
  end

  def top_three_recipes
    cards = self.recipe_cards.max_by(3) { |card| card.rating }
    cards.map { |card| card.recipe }
  end

  def most_recent_recipe
    self.recipe_cards.last.recipe
  end

  def recipe_cards
    RecipeCard.all.select { |card| card.user == self }
  end

end
