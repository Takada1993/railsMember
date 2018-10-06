class RenameLatestColumnToArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :latest, :latestClassification
  end
end
