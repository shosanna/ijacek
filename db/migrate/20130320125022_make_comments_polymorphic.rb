class MakeCommentsPolymorphic < ActiveRecord::Migration
  def change
    remove_column :comments, :entry_id
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
