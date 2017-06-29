module Web::Controllers::Videogames
  class Create
    include Web::Action

    expose :videogame

    params do
      required(:videogame).schema do
        required(:title).filled(:str?)
        required(:publisher).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
      VideogameRepository.new.create(params[:videogame])
      redirect_to routes.videogames_path
      else
        self.status = 422
      end
    end
  end
end
