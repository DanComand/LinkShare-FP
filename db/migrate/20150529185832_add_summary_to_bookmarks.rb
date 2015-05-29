class AddSummaryToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :summary, :string
  end
end
