require './app'
require 'spec_helper'

RSpec.feature "Attacking each other", :type => :feature do
  scenario "Confirm attack" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("You have administered a slap round the chops to Mal!")
  end

  scenario "Reduce player 2's HP by 20" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Mal's HP is 80")
  end

  scenario "After attack the turn is switched" do
    sign_in_and_play
    one_attack
    click_button("Attack")
    expect(page).to have_content("George's HP is 80")
  end

  scenario "'You lose' message is displayed when a player reaches 0HP" do
    sign_in_and_play
    one_dies
    expect(page).to have_content("Mal, you loose!")
  end
end
