class AddColumnToNotes < ActiveRecord::Migration[5.2]
  def change
  	add_column :notes, :libraries, :json
  end
end
