require "application_system_test_case"

class CoffeesTest < ApplicationSystemTestCase
  setup do
    @coffee = coffees(:one)
  end

  test "visiting the index" do
    visit coffees_url
    assert_selector "h1", text: "Coffees"
  end

  test "should create coffee" do
    visit coffees_url
    click_on "New coffee"

    fill_in "Date tried", with: @coffee.date_tried
    fill_in "Name", with: @coffee.name
    fill_in "Origin", with: @coffee.origin
    fill_in "Rating", with: @coffee.rating
    fill_in "Roast level", with: @coffee.roast_level
    fill_in "Roaster", with: @coffee.roaster
    fill_in "Tasting notes", with: @coffee.tasting_notes
    fill_in "Website url", with: @coffee.website_url
    click_on "Create Coffee"

    assert_text "Coffee was successfully created"
    click_on "Back"
  end

  test "should update Coffee" do
    visit coffee_url(@coffee)
    click_on "Edit this coffee", match: :first

    fill_in "Date tried", with: @coffee.date_tried
    fill_in "Name", with: @coffee.name
    fill_in "Origin", with: @coffee.origin
    fill_in "Rating", with: @coffee.rating
    fill_in "Roast level", with: @coffee.roast_level
    fill_in "Roaster", with: @coffee.roaster
    fill_in "Tasting notes", with: @coffee.tasting_notes
    fill_in "Website url", with: @coffee.website_url
    click_on "Update Coffee"

    assert_text "Coffee was successfully updated"
    click_on "Back"
  end

  test "should destroy Coffee" do
    visit coffee_url(@coffee)
    accept_confirm { click_on "Destroy this coffee", match: :first }

    assert_text "Coffee was successfully destroyed"
  end
end
