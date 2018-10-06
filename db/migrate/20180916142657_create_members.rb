class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :userName
      t.string :mailAddress
      t.string :password_digest
    end
  end
end
