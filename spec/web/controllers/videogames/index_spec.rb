require 'spec_helper'
require_relative '../../../../apps/web/controllers/videogames/index'

describe Web::Controllers::Videogames::Index do
  let(:action) { Web::Controllers::Videogames::Index.new }
  let(:params) { Hash[] }
  let(:repository) { VideogameRepository.new }

  before do
    repository.clear
    @videogame = repository.create(title: 'Donkey Kong Country', publisher: 'Rareware')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all videogames' do
    action.call(params)
    action.exposures[:videogames].must_equal [@videogame]
  end
end
