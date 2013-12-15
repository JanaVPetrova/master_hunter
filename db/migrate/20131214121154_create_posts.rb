class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :nickname
      t.text :description
      t.text :place
      t.date :date

      t.timestamps
    end
  end
end
