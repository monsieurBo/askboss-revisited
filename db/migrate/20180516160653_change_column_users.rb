class ChangeColumnUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :library, :json
  end
end
