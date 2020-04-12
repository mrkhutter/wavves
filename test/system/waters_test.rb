require "application_system_test_case"

class WatersTest < ApplicationSystemTestCase
  setup do
    @water = waters(:one)
  end

  test "visiting the index" do
    visit waters_url
    assert_selector "h1", text: "Waters"
  end

  test "creating a Water" do
    visit waters_url
    click_on "New Water"

    fill_in "Feeling", with: @water.feeling
    fill_in "Intensity", with: @water.intensity
    click_on "Create Water"

    assert_text "Water was successfully created"
    click_on "Back"
  end

  test "updating a Water" do
    visit waters_url
    click_on "Edit", match: :first

    fill_in "Feeling", with: @water.feeling
    fill_in "Intensity", with: @water.intensity
    click_on "Update Water"

    assert_text "Water was successfully updated"
    click_on "Back"
  end

  test "destroying a Water" do
    visit waters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Water was successfully destroyed"
  end
end
