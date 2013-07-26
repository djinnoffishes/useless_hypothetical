class HypotheticalsController < ApplicationController
  before_action :set_hypothetical, only: [:show, :edit, :update, :destroy]

  # GET /hypotheticals
  # GET /hypotheticals.json
  def admin
    @hypotheticals = Hypothetical.all
  end

  def vote
    @voting_object = Hypothetical.find(params[:id])
    if params[:selection] == 1
      @voting_object.increment_hypo1!
    else
      @voting_object.increment_hypo2!
    end
    redirect_to root_path
  end

  # GET /hypotheticals
  def index
    @random_set = Hypothetical.order("RANDOM()").first
  end

  # GET /hypotheticals/1
  # GET /hypotheticals/1.json
  def show
    @hypothetical = Hypothetical.find(params[:id])
  end

  # GET /hypotheticals/new
  def new
    @hypothetical = Hypothetical.new
  end

  # GET /hypotheticals/1/edit
  def edit
  end

  # POST /hypotheticals
  # POST /hypotheticals.json
  def create
    @hypothetical = Hypothetical.new(hypothetical_params)

    respond_to do |format|
      if @hypothetical.save
        format.html { redirect_to @hypothetical, notice: 'Hypothetical was successfully created.' }
        format.json { render action: 'show', status: :created, location: @hypothetical }
      else
        format.html { render action: 'new' }
        format.json { render json: @hypothetical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hypotheticals/1
  # PATCH/PUT /hypotheticals/1.json
  def update
    respond_to do |format|
      if @hypothetical.update(hypothetical_params)
        format.html { redirect_to @hypothetical, notice: 'Hypothetical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @hypothetical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hypotheticals/1
  # DELETE /hypotheticals/1.json
  def destroy
    @hypothetical.destroy
    respond_to do |format|
      format.html { redirect_to hypotheticals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hypothetical
      @hypothetical = Hypothetical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hypothetical_params
      params.require(:hypothetical).permit(:hypo1, :hypo2)
    end

end
