require 'spec_helper'

describe Videogame do
  it 'can be initialized with attributes' do
    videogame = Videogame.new(title: 'Star Fox', publisher: 'Nintendo')
    videogame.title.must_equal 'Star Fox'
  end
end
