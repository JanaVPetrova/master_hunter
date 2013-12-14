class SetInitialStateToPosts < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end

  def up
    Post.reset_column_information
    Post.update_all state: "active"
  end

  def down
  end
end
