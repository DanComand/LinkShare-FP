class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :code
      t.integer :list_id
      t.string :email
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
