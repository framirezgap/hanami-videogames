# Hanami framework key commands

### Create application from scratch:
```bash
% gem install hanami
% hanami new hanami-videogames
```

Additional parameters:

If we want to user another database
```bash
% hanami new hanami-videogames --database=postgres
```
To use another test framework
```bash
% hanami new hanami-videogames --test=rspec
```

### Application startup
```bash
% bundle install
% bundle exec hanami server
```

### Prepare database and run migrations
```bash
% hanami db create
% bundle exec hanami db prepare
% HANAMI_ENV=test bundle exec hanami db prepare
```

### Generate controller, view, routes for a specific model
```bash
% bundle exec hanami generate action web videogames#index
````

### Console
```bash
% bundle exec hanami console
````

### Create item from console
```bash
repository = VideogameRepository.new
videogame = repository.create(title: 'foo', publisher: 'bar')
repository.find(videogame.id)
```

### Rspec testing
```bash
% rake test
````
