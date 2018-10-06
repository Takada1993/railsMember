class AddartilcleDetailToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :articleDetail, :string
  end
end
