class RenamePickUpColumnToArticles < ActiveRecord::Migration[5.1]
  def change
    rename_column :articles, :pickUp, :pickUpClassification
  end
end
