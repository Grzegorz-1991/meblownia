class MeblesController < ApplicationController
    before_action :set_meble, only: [:show, :edit, :update, :destroy]

    def show

    end

    def index
        @mebles = Meble.paginate(page: params[:page], per_page: 5)
    end

    def create
        @meble = Meble.new(meble_params)
        @meble.user = User.first
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
        params.require(:meble).permit(:nazwa,:rodzaj,:opis)
    end
end