class HypotheticalsController < ApplicationController
  before_filter :authenticate , :only => [:admin, :update, :destroy, :edit]
  before_action :set_hypothetical, only: [:show, :edit, :update, :destroy]
  before_action :init_session

  def about
  end

  def init_session

    session[:votes] ||= [-1]
  end

  # GET /hypotheticals
  # GET /hypotheticals.json
  def admin
    @hypotheticals = Hypothetical.all
  end

  def vote
    @voting_object = Hypothetical.find(params[:id])
    if params[:selection] == '1'
      @voting_object.increment_hypo1!
      @@ratio = ((@voting_object[:hypo1_votes].to_f / (@voting_object[:hypo1_votes].to_f + @voting_object[:hypo2_votes].to_f)) * 100).round
    else
      @voting_object.increment_hypo2!
      @@ratio = ((@voting_object[:hypo2_votes].to_f / (@voting_object[:hypo1_votes].to_f + @voting_object[:hypo2_votes].to_f)) * 100).round
    end
    session[:votes] << @voting_object.id
    redirect_to root_path, notice: "#{@@ratio}% of people agree with you."
  end

  # GET /hypotheticals
  def index
    @random_set = Hypothetical.where("id NOT IN (?)", session[:votes]).order("RANDOM()").first
    if @random_set.blank?
      redirect_to nomore_path, notice: "#{@@ratio}% of people agree with you."
    end
  end

  # GET /hypotheticals/1
  # GET /hypotheticals/1.json
  def show
    redirect_to root_path
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
      format.html { redirect_to hypotheticals_url, notice: 'Destroyed!' }
      format.json { head :no_content }
    end
  end

  private

    #some basic http authentication for the admin pages    
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "admin" && password == "123"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_hypothetical
      @hypothetical = Hypothetical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hypothetical_params
      params.require(:hypothetical).permit(:hypo1, :hypo2)
    end

end
