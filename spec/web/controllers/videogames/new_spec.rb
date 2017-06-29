require 'spec_helper'
require_relative '../../../../apps/web/controllers/videogames/new'

describe Web::Controllers::Videogames::New do
  let(:action) { Web::Controllers::Videogames::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
