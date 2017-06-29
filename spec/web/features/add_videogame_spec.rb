require 'features_helper'

describe 'Add a videogame' do
  after do
    VideogameRepository.new.clear
  end

  it 'can create a new videogame' do
    visit '/videogames/new'

    within 'form#videogame-form' do
      fill_in 'Title',  with: 'New videogame'
      fill_in 'Publisher', with: 'Some publisher'

      click_button 'Create'
    end

    current_path.must_equal('/videogames')
    assert page.has_content?('New videogame')
  end

  # it 'displays list of errors when params contains errors' do
  #   visit '/videogames/new'
  #
  #   within 'form#videogame-form' do
  #     click_button 'Create'
  #   end
  #
  #   current_path.must_equal('/videogames')
  #
  #   assert page.has_content?('There was a problem with your submission')
  #   assert page.has_content?('Title must be filled')
  #   assert page.has_content?('Author must be filled')
  # end
end
