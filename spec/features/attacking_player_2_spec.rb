require './app'
require 'spec_helper'

RSpec.feature "Attacking player 2", :type => :feature do
  scenario "Confirm attack" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("You have administered a slap round the chops to Mal!")
  end

  scenario "Reduce player 2's HP by 10" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Player 2's HP is reduced by 10")
  end
end
