class MemberInputController < ApplicationController
  before_action :set_member, only: [:input, :create]
  
  def input
  end
  
  def new
    @members = Member.new
  end
 
 # 登録確認
  def confirm
    @members = Member.new(member_params)
    # 戻るボタン押下でトップへ遷移
    if params[:back_btn]
      redirect_to '/article/top'
    #登録ボタン押下で確認画面へ遷移
    elsif params[:regist_btn]
      #エラーチェック
      if @members.valid?
        session[:membersInput] = @members
        render 'member_input/confirmation'
      else 
        render 'member_input/input'
      end
      
    end
  end
  
  #会員情報登録
  def create
    #戻るボタン押下で登録画面へ遷移
    if params[:back_btn]
      redirect_to '/member_input/input'
      session[:membersInput] = nil
    #登録ボタン押下で会員情報登録
    elsif params[:regist_btn]
      @members = Member.create(member_params)
      if @members.save
        render 'member_input/completion'
        session[:membersInput] = nil
      end
    end
  end
  
  #登録情報変更
  
  def edit
    @members = Member.find(params[:id])
  end

  def update
    # 戻るボタン押下でトップへ遷移
    if params[:back_btn]
      redirect_to '/article/top'
    #変更ボタン押下で登録情報更新
    elsif params[:regist_btn]
      @members = Member.find(params[:id])
      if @members.update_attributes(member_params)
        redirect_to '/article/top'
        flash[:success] = "プロフィールを更新しました" 
      else
        render'edit'
      end
    end
  end
    
  
  private
  
  def set_member
    @members = Member.new
  end
    
  def member_params
    params.require(:member).permit(:userName,:mailAddress,:password,:password_confirmation)
  end
end
