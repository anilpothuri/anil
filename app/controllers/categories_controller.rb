class CategoriesController <ApplicationController
  def new
    @category=Category.new
  end

  def index
    @categories=Category.paginate(page: params[:page], per_page: 4)

  end

  def create
    @category=Category.new(category_params)
   if @category.save
     flash[:notice]="Category was succesully creatde"
     redirect_to @category
   else
     render 'new'

   end
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update
     @category=Category.find(params[:id])
     if @category.update(category_params)
       flash[:notice]="category namw was succefully updated"
       redirect_to @category
     else
       render 'edit'
     end
  end

  def show
    @category = Category.find(params[:id])

  end


  private
  def category_params
  params.require(:category).permit(:name)
  end


end
