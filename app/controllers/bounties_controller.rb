class BountiesController < ApplicationController

  before_action :set_bounty, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @bounties = Bounty.all
  end

  def show
  end

  def new
    @bounty = Bounty.new
  end

  def edit
    @users = User.point_earner.order(:name)
    raise 'Bounty already claimed' if @bounty.claimed?
  end

  def create
    @bounty = Bounty.new(bounty_params)
    @bounty.created_by_id = current_user.id

    respond_to do |format|
      if @bounty.save
        format.html { redirect_to bounties_path, notice: 'Bounty was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @bounty.update(bounty_params)
        format.html { redirect_to bounties_path, notice: 'Bounty was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @bounty.destroy
    respond_to do |format|
      format.html { redirect_to bounties_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bounty
      @bounty = Bounty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bounty_params
      params.require(:bounty).permit(:name, :description, :reward, :claimed_by_id, :needs_claiming_by, :claimed_at)
    end
end
