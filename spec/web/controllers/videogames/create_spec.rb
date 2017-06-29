require 'spec_helper'
require_relative '../../../../apps/web/controllers/videogames/create'

describe Web::Controllers::Videogames::Create do
  let(:action) { Web::Controllers::Videogames::Create.new }
  let(:repository) { VideogameRepository.new }

  before do
    repository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[videogame: { title: 'Some game', publisher: 'Some publisher' }] }
    it 'creates a new videogame' do
      action.call(params)
      videogame = repository.last

      videogame.id.wont_be_nil
      videogame.title.must_equal params.dig(:videogame, :title)
    end

    it 'redirects the user to the videogames listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/videogames'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[videogame: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      errors.dig(:videogame, :title).must_equal  ['is missing']
      errors.dig(:videogame, :publisher).must_equal ['is missing']
    end
  end
end
