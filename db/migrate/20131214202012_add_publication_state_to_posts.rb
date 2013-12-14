class AddPublicationStateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publication_state, :string
  end
end
