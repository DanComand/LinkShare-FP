class AddListIdToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :list_id, :integer
  end
end
