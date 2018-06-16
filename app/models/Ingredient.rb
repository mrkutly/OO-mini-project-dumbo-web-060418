class Ingredient < ActiveRecord::Base

  def self.most_common_allergen
    array = Allergen.all.map { |allergen| self.find_by(id: allergen.ingredient_id) }
    array.sort_by { |el| array.count(el) }.last
  end

end
