class AddUserIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :user_id, :integer
  end
end
