class Recipe < ActiveRecord::Base

  def self.most_popular
    self.all.max_by { |recipe| recipe.users.count }
  end

  def add_ingredients(arr)
    arr.each { |ingredient| RecipeIngredient.create(recipe_id: self.id, ingredient_id: ingredient.id) }
  end

  def allergens
    allergens = Allergen.all.select { |allergen| self.ingredients.include?(Ingredient.find_by(id: allergen.ingredient_id)) }
    allergens.map { |allergen| Ingredient.find_by(id: allergen.ingredient_id) }.uniq
  end

  def ingredients
    recipe_ings = RecipeIngredient.all.select{ |ingredient| ingredient.recipe_id == self.id }
    recipe_ings.map { |recipe_ing| Ingredient.find_by(id: recipe_ing.ingredient_id) }
  end

  def users
    cards = RecipeCard.all.select { |card| card.recipe_id == self.id }
    cards.map { |card| User.find_by(id: card.user_id) }
  end

end
