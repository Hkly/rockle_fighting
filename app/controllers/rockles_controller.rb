class RocklesController < ApplicationController
  before_action :ensure_signed_in

  def new
    @species = %w(a b c d e)
    @rockle = Rockle.new
    @user_id = current_user.id

  end

  def index
    @rockles = Rockle.all

    @rockles.each do |rockle|
      rockle.user = User.find(rockle.user_id)
    end
    render 'index'
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
    @rockle.user = User.find(@rockle.user_id)
  end

  private

  def rockle_params
    params.require(:rockle).permit(:name, :species)
  end
end
