class ArticlesController < ApplicationController
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:destroy, :edit, :update]
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def new
        @article = Article.new
    end
   def index
       @articles = Article.all
   end
    def show
    end
    def create
       @article = Article.new(article_params)
        if  @article.save
          flash[:notice] = "Blog created successfully"
          redirect_to @article
        else
           render 'new'
        end
    end
    def edit 
    end
    def update
        if @article.update(article_params)
            flash[:notice] = "Article updated successfully"
            redirect_to @article
        else
        render 'edit'
        end
    end
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
    def set_article
        @article = Article.find(params[:id])
    end
    def require_same_user
           if current_user != @article.user && !current_user.admin?
            flash[:alert] = "you can only edit or delete your own article"
            redirect_to @article
           end
       end
end
