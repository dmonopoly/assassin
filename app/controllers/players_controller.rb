class PlayersController < ApplicationController
  before_action :set_player, only: [:update, :destroy]

  # POST /players
  # POST /players.json
  # TODO: fix
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player.game, notice: 'Player was successfully created.' }
        format.json { render 'games/show', status: :created, location: @player.game }
      else
        format.html { render 'games/show' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1
  # PATCH/PUT /players/1.json
  def update
    # If no checkboxes are selected, set this to be an empty array. If we don't
    # do this, then unchecking all selections and updating would result in the
    # user still having its previous selections (because no ids are passed).
    # http://railscasts.com/episodes/17-habtm-checkboxes
    params[:player][:rival_ids] ||= []

    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to @player.game, notice: 'Player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render 'games/show' }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    game = @player.game
    @player.destroy
    respond_to do |format|
      format.html { redirect_to game }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:name, :rival_ids => [])
    end
end