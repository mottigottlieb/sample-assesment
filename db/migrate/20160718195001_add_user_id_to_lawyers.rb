class AddUserIdToLawyers < ActiveRecord::Migration
  def change
    add_column :lawyers, :user_id, :integer
  end
end
