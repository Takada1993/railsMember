class MemberInputController < ApplicationController
  before_action :set_member, only: [:input, :create]
  
  def input
    # TODO: cssを適用して設計書通りにレイアウトを整える
    # cssを会員と記事で別々に適用したい場合は下記のように記述すればフォルダ内のCSSはすべて適用される。
    # ※ただしフォルダ構成についてはよく検討して作成すること
    # Rails.application.config.assets.precompile += %w( (フォルダ名)/* )
  end
  
  def new
    @members = Member.new
  end
 
  def confirm
    @members = Member.new(member_params)
    
    if params[:back_btn]
      redirect_to '/article/top'
    elsif params[:regist_btn]
      render 'member_input/input' if @members.invalid?
      render 'member_input/confirmation' if @members.valid?
    end
  end
  
  def create
    if params[:back_btn]
      render 'member_input/input'
    elsif params[:regist_btn]
          Member.create(
                  userName: params[:userName],mailAddress: params[:mailAddress],
                  password: params[:password],
                  )
      render 'member_input/completion'
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
