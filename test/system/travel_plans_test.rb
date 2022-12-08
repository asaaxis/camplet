require "application_system_test_case"

class TravelPlansTest < ApplicationSystemTestCase
  setup do
    @travel_plan = travel_plans(:one)
  end

  test "visiting the index" do
    visit travel_plans_url
    assert_selector "h1", text: "Travel Plans"
  end

  test "creating a Travel plan" do
    visit travel_plans_url
    click_on "New Travel Plan"

    fill_in "End schedule at", with: @travel_plan.end_schedule_at
    fill_in "Name", with: @travel_plan.name
    fill_in "Start schedule at", with: @travel_plan.start_schedule_at
    fill_in "Team", with: @travel_plan.team_id
    click_on "Create Travel plan"

    assert_text "Travel plan was successfully created"
    click_on "Back"
  end

  test "updating a Travel plan" do
    visit travel_plans_url
    click_on "Edit", match: :first

    fill_in "End schedule at", with: @travel_plan.end_schedule_at
    fill_in "Name", with: @travel_plan.name
    fill_in "Start schedule at", with: @travel_plan.start_schedule_at
    fill_in "Team", with: @travel_plan.team_id
    click_on "Update Travel plan"

    assert_text "Travel plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Travel plan" do
    visit travel_plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Travel plan was successfully destroyed"
  end
end
