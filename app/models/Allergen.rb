class Allergen < ActiveRecord::Base
  belongs_to :user
  has_one :ingredient
end
