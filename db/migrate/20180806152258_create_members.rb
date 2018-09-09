class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :memberId
      t.string :userName
      t.string :mailAddress
      t.string :password

      t.timestamps
    end
  end
end
