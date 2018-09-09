class RenameDeleteColumnToArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :delete, :deleteClassification
  end
end
