class MeblesController < ApplicationController

    def show
        @meble = Meble.find(params[:id])
    end

    def index
        @mebles = Meble.all
    end

    def create
        @meble = Meble.new(params.require(:meble).permit(:nazwa,:rodzaj,:opis))
        if @meble.save
            flash[:notice] = "Artykuł poprawnie utworzono!"
            redirect_to @meble
        else
            render 'new'
        end
    end

    def new
        @meble = Meble.new
    end

    def edit
        @meble = Meble.find(params[:id])
    end

    def update
        @meble = Meble.find(params[:id])
        if @meble.update(params.require(:meble).permit(:nazwa,:rodzaj,:opis))
            flash[:notice] = "Poprawnie edytowano artykuł."
            redirect_to @meble
        else
            render 'edit'
        end
    end
end