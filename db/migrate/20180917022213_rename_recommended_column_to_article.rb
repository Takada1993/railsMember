class RenameRecommendedColumnToArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :Recommended, :recommendedClassification
  end
end
