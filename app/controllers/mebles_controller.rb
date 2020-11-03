class MeblesController < ApplicationController
    before_action :set_meble, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def show

    end

    def index
        @mebles = Meble.paginate(page: params[:page], per_page: 5)
    end

    def create
        @meble = Meble.new(meble_params)
        @meble.user = current_user
        if @meble.save
            flash[:notice] = "Mebel poprawnie utworzono!"
            redirect_to @meble
        else
            render 'new'
        end
    end

    def new
        @meble = Meble.new
    end

    def edit
       
    end

    def update
    
        if @meble.update(meble_params)
            flash[:notice] = "Poprawnie edytowano mebel."
            redirect_to @meble
        else
            render 'edit'
        end
    end

    def destroy
     
        @meble.destroy
        redirect_to mebles_path
    end

    private
    
    def set_meble
        @meble = Meble.find(params[:id])
    
    end

    def meble_params
        params.require(:meble).permit(:nazwa,:rodzaj,:opis, category_ids: [])
    end

    def require_same_user
        if current_user != @meble.user && !current_user.admin?
            flash[:alert] = "Możesz edytowac tylko swój mebel cwaniaku!"
            redirect_to @meble
        end
    end
end