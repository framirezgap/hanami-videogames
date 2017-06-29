Hanami framework key commands

Creation application from scratch
% gem install hanami
% hanami new bookshelf

Additional parameters:
If we want to user another database
% hanami new bookshelf --database=postgres
To use another test framework
% hanami new bookshelf --test=rspec

Application startup
% bundle install
% bundle exec hanami server

Prepare database and run migrations
% hanami db create
% bundle exec hanami db prepare
% HANAMI_ENV=test bundle exec hanami db prepare

Generate controller, view, routes for a specific model
bundle exec hanami generate action web books#index

Console
% bundle exec hanami console

Create item from console
repository = VideogameRepository.new
book = repository.create(title: 'foo', publisher: 'bar')
repository.find(videogame.id)

Rspec testing
% rake test
