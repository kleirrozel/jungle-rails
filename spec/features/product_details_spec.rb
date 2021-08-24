require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

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

  scenario "They see the product description page" do
    visit root_path
    first('.product').click 'Details'

    # commented out b/c it's for debugging only
    save_and_open_screenshot

    # puts page.html

    expect(page).to have_css 'article.product'
  end
end