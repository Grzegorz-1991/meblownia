class UsersController < ApplicationController

    def nowy
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @mebles = @user.mebles.paginate(page: params[:page], per_page: 5)
    end

    def index
        @user = User.paginate(page: params[:page], per_page: 5)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Jesteś nowym użytkownikiem #{@user.username} ziom!"
            redirect_to mebles_path
        else
            render 'nowy'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
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
end