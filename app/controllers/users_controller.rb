class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    
    def new
        @user = User.new
    end
    def index
        @users = User.all
    end
    def
    def show
        @articles = @user.articles
    end
    def edit
    end
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Blogging #{@user.username}you have successfully signup"
            redirect_to articles_path
        else
            render 'new'
        end
        
    end
    def update
        if @user.update(user_params)
            flash[:notice] = "your account updated successfully"
            redirect_to articles_path
        else
            render 'edit'
        end
        def destroy
            @user.destroy
            session[:user_id] = nil if @user == current_user
            flash[:notice] = "your account and all associated blogs deleted successfully"
            redirect_to @articles_path
        end
    end
  private 
  def user_params
      params.require(:user).permit(:username, :email, :password)
  end
  def set_user
      @user = User.find(params[:id])
  end
   def require_same_user
            if current_user != @user && !current_user.admin?
                flash[:alert] = "you can only edit or delete your account profile"
                redirect_to @user
            end
        end
end