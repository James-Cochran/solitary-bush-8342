require 'rails_helper'

RSpec.describe "Ingredients Index" do
   # User Story 1
    describe "When I visit Ingredients Index" do
        it "has a list of all ingredients including name and cost" do
            ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
            ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)

            visit "/ingredients"

            expect(page).to have_content("Ground Beef: 2")
            expect(page).to have_content("Salt: 4")
            
        end
    end
end

