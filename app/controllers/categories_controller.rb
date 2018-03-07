class CategoriesController < ApplicationController

	before_action :set_category, only: [ :show,:edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def show
		@posts = Post.where(category_id: [@category]).paginate(page: params[:page], per_page: 3)
	end

	def new
		@category = Category.new
	end

   def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path, success: 'Статья успешно добавлена'
		else
			flash.now[:danger] = 'Статья не  добавлена'
			render :new  
		end
	end

	def edit

	end

	def update

		if @category.update_attributes(post_params)
			redirect_to categories_path, success: 'Статья успешно обновлена'
		else
			flash.now[:danger] = 'Статья не  обновлена'
			render :edit
		end
	end

	def destroy
		@category.destroy
		redirect_to categories_path
	end

private

	def set_category
		@category = Category.find(params[:id])
	end

	def category_params
	params.require(:category).permit(:name, :description)
	end

end