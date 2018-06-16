class CreateRecipeCards < ActiveRecord::Migration[4.2]
  def change
    create_table :recipe_cards do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.string :date
      t.integer :rating
    end
  end
end
