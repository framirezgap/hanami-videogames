require 'spec_helper'
require_relative '../../../../apps/web/views/videogames/new'

describe Web::Views::Videogames::New do
  let(:params) { OpenStruct.new(valid?: false, error_messages: ['Title must be filled', 'Publisher must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/videogames/new.html.erb') }
  let(:view)      { Web::Views::Videogames::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title must be filled')
    rendered.must_include('Publisher must be filled')
  end
end
