class ListingController < ApplicationController
  before_action :set_residence, only: [:show]
  before_action :verify_if_archived, only: [:show, :edit, :update]

  # GET /listing/1
  # GET /listing/1.json
  def show
    session[:return_to] ||= request.referer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residence
      @residence = Residence.includes(:pictures).find(params[:id])
    end

    def verify_if_archived
      redirect_to root_path if @residence.archived?
    end

end
