class UsersController < ApplicationController
  before_action :admin_user, only: :destroy
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show]
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
  end

  def index
    @users = User.active
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save

      UserMailer.account_activation(@user).deliver_now
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url

      # log_in @user
      # flash[:success] = 'Success'
      # redirect_to @user
    else
      flash[:error] = 'Womp womp...'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Success'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def admin_user
      if current_user
        redirect_to(root_url) unless current_user.admin?
      else
        redirect_to(root_url)
      end
    end

end
