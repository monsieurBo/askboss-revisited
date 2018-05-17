class CreateFlashCards < ActiveRecord::Migration[5.2]
  def change
    create_table :flash_cards do |t|
    	t.belongs_to :user, index: true
    end
  end
end
