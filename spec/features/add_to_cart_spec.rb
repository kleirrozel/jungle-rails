require 'rails_helper'

RSpec.feature "Visitor adds items to cart", type: :feature do
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Each time an item is added to the cart, My Cart number increases by one" do
    visit root_path
    first('article.product').click_on('Add')

    # puts page.html

    expect(page).to have_text 'My Cart (1)'
  end
end
