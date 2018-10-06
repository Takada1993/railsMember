class ArticleController < ApplicationController
  before_action :set_article
  def top
    set_top
  end
  
  def article_list 
	  @articles = Article.where(articleClassification: params[:articleClassification])
  end
  
  def search
    if params[:articleName].nil?
      flash[:notice] = "検索内容を入力してください。"
      redirect_to '/article/top'
    else
      @articles = Article.where('articleName LIKE ?', "%#{params[:articleName]}%")
      @articles_number = @articles.length
      if @articles.nil? || @articles_number == 0
        flash[:notice] = "該当記事が有りません。"
        redirect_to '/article/top'
      else
        #render 'article/article_list' if @articles.valid?
        render 'article/article_list'
      end
    end
    # TODO: エラーチェックを行い検索文字は全角半角英数字のみ入力するように制限してみる
    
    # TODO: 一件も取得していない場合はTOPに戻りコメントを返す(済)
    # flash[:notice]を使用するのがオススメ
    
    # TODO: リスト画面にTOPへ戻るボタンを追加(済)
  end
  
  def show
    @articles = Article.find_by(articleNumber: params[:articleNumber])
  end
  
  def input
    @articles = Article.new
  end
  
  def create
    #戻るボタン押下でトップ画面へ遷移
    if params[:back_btn]
      render 'article/top'
    #登録ボタン押下で会員情報登録
    elsif params[:regist_btn]
      cnt = Article.count + 1
      @articles = Article.create(:articleName  => params[:articleName], 
                                 :articleDetail  => params[:articleDetail],
                                 :articleClassification => params[:articleClassification][:values],
                                 :articleNumber  => cnt)
      if @articles.save
        render 'article/top'
      else
        @errors = @articles
        render template: "err/error"
      end
    end
  end

  private
  
    def set_article
      @articles = Article.new
    end
      
    def article_params
      params.require(:article).permit(:articleName,:articleDetail)
    end
    
    def set_top
      @memberName = session[:Name]
    end
end
