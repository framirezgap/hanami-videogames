module Web::Controllers::Videogames
  class Index
    include Web::Action

    expose :videogames

    def call(params)
      @videogames = VideogameRepository.new.all
    end
  end
end
