class SetInitialStoryStateToPosts < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end

  def up
    Post.reset_column_information
    Post.update_all story: :processed
  end

  def down
  end
end
