class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index,:show]

    def new
        @category = Category.new
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:notice] = "Kategorię poprawnie edytowano!"
            redirect_to @category
        else
            render 'edit'
        end
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Zapisano kategorię"
            redirect_to @category
        else
            render 'new'
        end
    end
    
    def show
        @category = Category.find(params[:id])
        @mebles= @category.mebles.paginate(page: params[:page], per_page: 5)
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Tylko admin może wykonać tą akcję!"
            redirect_to categories_path
        end
    end
end