class AddStoryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :story, :string
  end
end
