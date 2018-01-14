require "rails_helper"

RSpec.feature "landing page" do
  context "when document is ready" do
    scenario "can get the random city's weather information" do
      visit root_path

      expect(page.text).to match(/The weather in (\w|\W)+, \w{2} now is/)
    end

    scenario "give random weather information" do
      visit root_path
      first_visit_info = page.text
      visit root_path
      second_visit_info = page.text

      expect(second_visit_info).not_to eq(first_visit_info)
    end

    scenario "get result after submit city name from search box", js: true do
      visit root_path
      fill_in "city_name", with: "London"
      click_on "Go!"
      wait_for_ajax
      expect(page.text).to match(/London/)
    end
  end
end
