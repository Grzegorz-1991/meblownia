class UsersController < ApplicationController

    def nowy
        @user = User.new
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

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end