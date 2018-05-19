class AddColumnToFlashCards < ActiveRecord::Migration[5.2]
  def change
  	add_column :flash_cards, :name, :string
  end
end
