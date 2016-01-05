class ResidencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_residence, only: [:show, :edit, :update, :destroy]
  before_action :verify_residence_ownership, only: [:show, :edit, :update, :destroy]
  before_action :verify_if_archived, only: [:show, :edit, :update]

  # GET /residences
  # GET /residences.json
  def index
    current_user.update(owner_enabled: true)
    @residences = current_user.published_residences.active
  end

  # GET /residences/1
  # GET /residences/1.json
  def show
    @pictures = @residence.pictures.all
  end

  # GET /residences/new
  def new
    @residence = Residence.new
    @pictures = @residence.pictures.build
  end

  # GET /residences/1/edit
  def edit
  end

  # POST /residences
  # POST /residences.json
  def create
    @residence = Residence.new(residence_params)
    @residence.user = current_user

    unless params[:pictures].nil?
      params[:pictures]['picture'].each do |picture|
         @pictures = @residence.pictures.build(picture: picture)
      end
    end
    
    respond_to do |format|
      if @residence.save
        format.html { redirect_to @residence, notice: 'Residence was successfully created.' }
        format.json { render :show, status: :created, location: @residence }
      else
        format.html { render :new, residence: @residence }
        format.json { render json: @residence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /residences/1
  # PATCH/PUT /residences/1.json
  def update
    respond_to do |format|
      if @residence.update(residence_params)
        format.html { redirect_to @residence, notice: 'Residence was successfully updated.' }
        format.json { render :show, status: :ok, location: @residence }
      else
        format.html { render :edit }
        format.json { render json: @residence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residences/1
  # DELETE /residences/1.json
  def destroy
    @residence.archive
    respond_to do |format|
      format.html { redirect_to residences_url, notice: 'Residence was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residence
      @residence = Residence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residence_params
      params.require(:residence).permit(
        :name,
        :address,
        :price,
        :square_meters,
        :description,
        :rooms,
        pictures_attributes: [:picture]
      )
    end

    def verify_residence_ownership
      redirect_to residences_path unless @residence.user == current_user
    end

    def verify_if_archived
      redirect_to residences_path if @residence.archived?
    end
end
