class KeysallsController < ApplicationController
  before_action :set_keysall, only: [:show, :edit, :update, :destroy]

  # GET /keysalls
  # GET /keysalls.json
  def index
    @keysalls = Keyword.all
  end

  # GET /keysalls/1
  # GET /keysalls/1.json
  def show
  end

  # DELETE /keysalls/1
  # DELETE /keysalls/1.json
  def destroy
    @keysall.destroy
    respond_to do |format|
      format.html { redirect_to keysalls_url, notice: 'Keysall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keysall
      @keysall = Keyword.find(params[:id])
    end

end
