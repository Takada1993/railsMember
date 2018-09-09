class Article < ApplicationRecord
  validates :articleName,presence: true,
    format: {
              with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
              message: '検索出来ない文字が含まれています。'
            }
end
