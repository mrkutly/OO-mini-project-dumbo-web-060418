class Ingredient < ActiveRecord::Base
  has_many :users, through: :allergens
  has_and_belongs_to_many :recipes, through: :recipeingredients

  def self.most_common_allergen
    array = Allergen.all.map { |allergen| self.find_by(id: allergen.ingredient_id) }
    array.sort_by { |el| array.count(el) }.last
  end

end
