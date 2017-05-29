class Admin::UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = Person.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, flash: { success: 'success' }
    else
      flash[:error] = 'error'
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_back fallback_location: admin_users_url, flash: { success: 'success' }
    else
      redirect_back fallback_location: admin_users_url, flash: { success: 'error' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = Person.find_by!(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:person).permit(:name)
    end
end
