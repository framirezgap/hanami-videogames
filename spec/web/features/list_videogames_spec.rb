require 'features_helper'

describe 'List videogames' do
  let(:repository) { VideogameRepository.new }
  before do
    repository.clear

    repository.create(title: 'ROM1', publisher: 'Znes')
    repository.create(title: 'ROM2', publisher: 'SnesX')
  end

  it 'displays each videogame on the page' do
    visit '/videogames'

    within '#videogames' do
      assert page.has_css?('.videogame', count: 2), 'Expected to find 2 videgames'
    end
  end
end
