class UsersController < ApplicationController
   # before_filter :authenticate_user!
   # before_filter :admin_only, :except => :show
  load_and_authorize_resource
  helper_method :sort_column, :sort_direction

  def index
    authorize! :manage, @users , :message => "Access denied."
    if params[:sort] == nil then
      @users = User.search(params[:search]).page(params[:page]).per(50)
    else
      @users = User.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per(50)
    end
  end

  def show
    authorize! :manage, @users
    @user = User.find(params[:id])
    # authorize! :read, @user
    # unless current_user.admin?
    #   unless @user == current_user
    #     redirect_to :back, :alert => "Access denied."
    #   end
    # end
  end

  def update
    authorize! :menage, @users,  :message => "Access denied."
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :menage, @users,  :message => "Access denied."
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  # def admin_only
  #   unless current_user.admin?
  #     redirect_to :back, :alert => "Access denied."
  #   end
  # end

  def secure_params
    params.require(:user).permit(:role)
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end