class ArticleController < ApplicationController
  before_action :set_article
  def top
    # TODO: cssを適用して設計書通りにレイアウトを整える
  end
  
  def article_list 
	  @articles = Article.all 
  end
  
  def search
    @articles = Article.new(article_params)
    if params[:articleName].nil?
      flash[:notice] = "検索内容を入力してください。"
      redirect_to '/article/top'
    else
      @articles = Article.where('articleName LIKE ?', "%#{params[:articleName]}%")
      @articles_number = @articles.length
        if @articles_number == 0
          flash[:notice] = "該当記事が有りません。"
          redirect_to '/article/top'
        else
          render 'article/article_list' if @articles.valid?
        end
    end
    # TODO: エラーチェックを行い検索文字は全角半角英数字のみ入力するように制限してみる
    
    # TODO: 一件も取得していない場合はTOPに戻りコメントを返す(済)
    # flash[:notice]を使用するのがオススメ
    
    # TODO: リスト画面にTOPへ戻るボタンを追加(済)
  end

  private
  
    def set_article
      @articles = Article.new
    end
      
    def article_params
      params.require(:article).permit(:articleName)
    end
end
