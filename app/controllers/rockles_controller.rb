class RocklesController < ApplicationController
  before_action :ensure_signed_in

  def new
    @species = %w(a b c d e)
    @rockle = Rockle.new
    render 'new'
  end

  def index
    if current_user.rockle.present?
      @rockles_in_range = Rockle.where(:level => (current_user.rockle.level - 3..current_user.rockle.level + 3)).where.not(:id => current_user.rockle.id)
    else
      redirect_to :back, :notice => 'Sorry only Rockles are allowed to fight in the stadium.'
    end
  end

  def create
    @rockle = Rockle.new(name: params[:rockle][:name], species: params[:rockle][:species])
    @rockle.user_id = current_user.id

    if @rockle.save
      redirect_to rockle_url(@rockle)
    else
      flash[:error] = @rockle.errors.full_messages
      redirect_to new_user_rockle_url(current_user)
    end
  end

  def show
    @rockle = Rockle.find(params[:id]) #TODO: check params
    render 'show'
  end

  def fight
    @challenged_rockle = Rockle.find(params[:id])
    @winner, @loser = FightRockle.execute(@challenged_rockle,current_user.rockle)
    redirect_to rockles_path, :notice => "#{@winner.name} kicked #{@loser.name}'s butt!"
  end

  private

  def rockle_params
    params.require(:rockle).permit(:name, :species)
  end
end
