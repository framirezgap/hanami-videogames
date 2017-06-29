require 'spec_helper'
require_relative '../../../../apps/web/views/videogames/index'

describe Web::Views::Videogames::Index do
  let(:exposures) { Hash[videogames: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/videogames/index.html.erb') }
  let(:view)      { Web::Views::Videogames::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #videogames' do
    view.videogames.must_equal exposures.fetch(:videogames)
  end

  describe 'when there are no videogames' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no videogames yet.</p>')
    end
  end

  describe 'when there are videogames' do
    let(:videogame1)     { Videogame.new(title: 'ROM1', publisher: 'Znes') }
    let(:videogame2)     { Videogame.new(title: 'ROM2', publisher: 'SnesX') }
    let(:exposures) { Hash[videogames: [videogame1, videogame2]] }

    it 'lists them all' do
      rendered.scan(/class="videogame"/).count.must_equal 2
      rendered.must_include('Znes')
      rendered.must_include('SnesX')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no videogames yet.</p>')
    end
  end
end
