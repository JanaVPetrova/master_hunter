class RenameStoryToStoryStateInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :story, :story_state
  end
end
