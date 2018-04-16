class EpisodesController < OpenReadController
  before_action :set_episode, only: [:show, :update, :destroy]

  # GET /episodes
  def index
    @episodes = Episode.all

    render json: @episodes
  end

  # GET /episodes/1
  def show
    render json: @episode
  end

  # POST /episodes
  def create
    # @episode = current_user.episodes.build(episode_params)
    @episode = Episode.new(episode_params)
    @episode.user = current_user

    if @episode.save
      render json: @episode, status: :created, location: @episode
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /episodes/1
  def update
    if @episode.update(episode_params)
      render json: @episode
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /episodes/1
  def destroy
    @episode.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_episode
      # @episode = Episode.find(params[:id])
      # this allows only current user to edit only their episodes
      @episode = current_user.episodes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def episode_params
      params.require(:episode).permit(:user_id, :title, :date, :why, :description)
    end
end
