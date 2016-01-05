class PicturesController < ApplicationController
  before_action :set_picture, only: [:destroy]

	# DELETE /residences/1
  # DELETE /residences/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
