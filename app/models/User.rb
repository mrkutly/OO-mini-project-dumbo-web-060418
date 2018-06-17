class User < ActiveRecord::Base
  has_many :ingredients, through: :allergens
  has_many :recipes, through: :recipecards

  def add_recipe_card(recipe, date, rating)
    RecipeCard.create(user_id: self.id, date: date, rating: rating, recipe_id: recipe.id)
  end

  def allergens
    arr = Allergen.all.select { |allergen| allergen.user_id == self.id }
    arr.map { |allergen| Ingredient.find_by(id: allergen.ingredient_id) }
  end

  def declare_allergen(ingredient)
    Allergen.create(user_id: self.id, ingredient_id: ingredient.id)
  end

  def most_recent_recipe
    most_recent_card = self.recipe_cards.last
    Recipe.find_by(id: most_recent_card.recipe_id)
  end

  def recipes
    Recipe.all.select { |recipe| recipe.users.include?(self) }
  end

  def recipe_cards
    RecipeCard.all.select { |card| card.user_id == self.id }
  end

  def top_three_recipes
    cards = self.recipe_cards.max_by(3) { |card| card.rating }
    cards.map { |card| Recipe.find_by(id: card.recipe_id) }
  end

end
