def adds_a_bookmark
  fill_in 'url', with: 'www.bbc.co.uk'
  fill_in 'title', with: 'The Beeb'
  click_button 'Submit'
end
