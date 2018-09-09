class RenameRecommendedColumnToArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :Recommended, :RecommendedClassification
  end
end
