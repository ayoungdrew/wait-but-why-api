class RelationshipsController < OpenReadController
  before_action :set_relationship, only: [:show, :update, :destroy]
  # before_action :authenticate, only: [:index, :show, :create, :destroy, :update]

  # GET /relationships
  def index
    @relationships = Relationship.all

    render json: @relationships
  end

  # GET /relationships/1
  def show
    render json: @relationship
  end

  # POST /relationships
  def create
    @relationship = current_user.active_relationships.build(relationship_params)

      # user = User.find(relationship_params["followed_id"])
      # @relationship = current_user.follow(user)
      # redirect_to user

    if @relationship.save
      render json: @relationship, status: :created, location: @relationship
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /relationships/1
  def update
    @relationship = current_user.relationships.find(params[:id])
    if @relationship.update(relationship_params)
      render json: @relationship
    else
      render json: @relationship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /relationships/1
  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
      # @relationship = current_user.relationships.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def relationship_params
      params.require(:relationship).permit(:follower_id, :followed_id)
    end
end
