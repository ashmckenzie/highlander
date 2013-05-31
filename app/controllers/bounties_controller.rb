class BountiesController < ApplicationController

  before_action :set_bounty, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /bounties
  # GET /bounties.json
  def index
    @bounties = Bounty.created_by(current_user)
  end

  # GET /bounties/1
  # GET /bounties/1.json
  def show
  end

  # GET /bounties/new
  def new
    @bounty = Bounty.new
  end

  # GET /bounties/1/edit
  def edit
    @users = User.point_earner.order(:name)
    raise 'Bounty already claimed' if @bounty.claimed?
  end

  # POST /bounties
  # POST /bounties.json
  def create
    @bounty = Bounty.new(bounty_params)
    @bounty.created_by_id = current_user.id

    respond_to do |format|
      if @bounty.save
        format.html { redirect_to @bounty, notice: 'Bounty was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bounty }
      else
        format.html { render action: 'new' }
        format.json { render json: @bounty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bounties/1
  # PATCH/PUT /bounties/1.json
  def update
    respond_to do |format|
      if @bounty.update(bounty_params)
        format.html { redirect_to @bounty, notice: 'Bounty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bounty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bounties/1
  # DELETE /bounties/1.json
  def destroy
    @bounty.destroy
    respond_to do |format|
      format.html { redirect_to bounties_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bounty
      @bounty = Bounty.created_by(current_user).where('id = ?', params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bounty_params
      params.require(:bounty).permit(:name, :description, :points, :claimed_by_id, :needs_claiming_by, :claimed_at)
    end
end
