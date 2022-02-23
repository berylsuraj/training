class ArticlesController < ApplicationController
   before_action :set_article, only: %i[ show edit update destroy ]
  def index
    @articles=Article.all
  end

  def show
   # @article=Article.find(params[:id])
  end

  def new
    @article=Article.new
  end

  def edit
     #@article=Article.find(params[:id])
  end

  def create
    @article=Article.new(article_params)

    respond_to do |format|
      if @article.save
    
        format.html {  redirect_to article_url(@article),notice: "Article saved succesfully"}
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity}
      end
    end
  end

  def update
    #@article=Article.find(params[:id])
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article updated successfully"}
      else
        format.html { render :edit, status: :unprocessable_entity}
      
      end
    end
  end

  def destroy
   # @article=Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Product Deleted successfully"}
    end
  end

  

 


  private

  def set_article
    @article=Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:name,:quantity,:description)
  end

end
