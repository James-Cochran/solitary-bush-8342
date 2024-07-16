require 'rails_helper'

RSpec.describe "recipes show" do

    before(:each) do
        @recipe_1 = Recipe.create!(name: "Hamburger", complexity: 1, genre: "easy")
        @recipe_2 = Recipe.create!(name: "Fries", complexity: 2, genre: "fried")
        @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
        @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
        @ingredient_3 = Ingredient.create!(name: "Potato", cost: 5)

        @recipe_1.ingredients << [@ingredient_1]
        @recipe_2.ingredients << [@ingredient_2, @ingredient_3]
    end

    # User Story 2
    describe "when I visit recipies show page I see a recipies ingredients" do
       it "displays the recipe's name, complexity, genre, and ingredient names" do
        
            visit "/recipes/#{@recipe_2.id}"

            expect(page).to have_content(@recipe_2.name)
            expect(page).to have_content(@recipe_2.complexity)
            expect(page).to have_content(@recipe_2.genre)

            expect(page).to have_content(@ingredient_2.name)
            expect(page).to_not have_content(@ingredient_1.name)
       end
    end

    # User Story 3
    describe "when I visit recipies show page I see a recipies total cost" do
        it "displays the total cost of all the ingredients" do

            visit "/recipes/#{@recipe_2.id}"

            expect(page).to have_content(@recipe_2.name)
            expect(page).to have_content("Total_Cost: 9")
       end
    end
end