class SessionController < ApplicationController
  #ログイン処理
  def login
    #戻るボタン押下でトップへ遷移
    if params[:back_btn]
      redirect_to '/article/top'
    #新規登録ボタン押下で登録画面へ遷移
    elsif params[:new_btn]
      redirect_to '/member_input/input'
    #ログインボタン押下でログイン処理
    elsif params[:login_btn]
      if params.key?(:mailAddress) || params.key?(:password)
        members = Member.find_by_mailAddress(params[:mailAddress])
        if members && members.authenticate(params[:password])
          session[:Name] = members.userName
          redirect_to controller: :article, action: :top
        else
          session[:Name] = nil
          flash[:notice] = "メールアドレスかパスワードが間違っています。"
          render 'session/login'
        end
      end
    end
  end
  
  #ログアウト処理
  def logout
    reset_session
    render 'session/logout'
  end
    
end
