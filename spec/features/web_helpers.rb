def sign_in_and_play
  visit '/'
  fill_in "player1", :with => "George"
  fill_in "player2", :with => "Mal"
  click_button "Save"
end

def one_attack
  click_button("Attack")
  click_button("Back")
end

def one_dies
  one_attack
  one_attack
  one_attack
  one_attack
  one_attack
  one_attack
  one_attack
  one_attack
  click_button("Attack")
end
