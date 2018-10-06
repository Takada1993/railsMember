class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :articleId
      t.string :articleName
      t.integer :articleNumber
      t.integer :articleClassification
      t.time :articleContributionDate
      t.integer :Recommended
      t.integer :pickUp
      t.integer :latest
      t.integer :delete

      t.timestamps
    end
  end
end
