class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def nowy
        @user = User.new
    end

    def show
        @mebles = @user.mebles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @user = User.paginate(page: params[:page], per_page: 5)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Jesteś nowym użytkownikiem #{@user.username} ziom!"
            redirect_to mebles_path
        else
            render 'nowy'
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil if @user == current_user
        flash[:notice] = "Profil i dodane meble usunięto"
        redirect_to mebles_path
    end

    def edit

    end

    def update

        if @user.update(user_params)
            flash[:notice] = "Poprawnie zaktualizowano użytkownika"
            redirect_to @user
        else
            render 'edit'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, images: [])
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:alert] = "Możesz edytować lub usunąć tylko swój profil cwaniaku!"
            redirect_to @user
        end
    end
end
