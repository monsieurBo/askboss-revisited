class RemoveColumnUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :libraries, :json
  end
end
