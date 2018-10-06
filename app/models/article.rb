class Article < ApplicationRecord
  validates :articleName,presence: true
    # format: {
    #           with: /\A[!"#$%&'()*,\-.\/:;<>?@\[\\\]\^_`{|}~]+\z/,
    #           message: '検索出来ない文字が含まれています。'
    #         }
            
  validates :articleName,
    presence: {message: '記事タイトルが入力されていません。'}
    
  validates :articleDetail,
    presence: {message: '記事本文が入力されていません。'}
end
