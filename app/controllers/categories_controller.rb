class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  def categories_api
    categories_api = Category.where(public: false)
    subcategories_api = Subcategory.all
    # mark = []
    # all_api = categories_api + subcategories_api
    # subcategories_api.each_with_index do |s, i|
    #   s.markers.each_with_index do |t, y|
    #     mark.push(t.name)
    #   end
    # end
    # logger.info(mark)
    @categories = categories_api.map{|category|{
      id: category.id,
      name: category.name,
      subcategories: category.subcategories{|sub| sub.name},
      markers: category.subcategories.map{|sub| sub.markers{|marks| mark.name}}
    }}
    render json:@categories
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @categories = Category.all
    respond_to do |format|
      if @category.save
        format.js { render nothing: true}
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    @categories = Category.all
    respond_to do |format|
      if @category.update(category_params)
        format.js { render nothing: true }
        format.html { redirect_to @category, notice: "Category was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    if @category.destroy
      @categories = Category.all
      respond_to do |format|
        format.js { render nothing: true }
        format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :status)
    end
end
