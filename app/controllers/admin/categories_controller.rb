class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, except: %i(new create)

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".category_created"
      redirect_to @category
    else
      render :new
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".category_deleted"
    else
      flash[:danger] = t ".cant_delete"
    end
    redirect_to categories_path
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:sucess] = t ".category_updated"
      redirect_to @category
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "admin.categories.load_category.category_not_found"
    redirect_to root_path
  end
end
