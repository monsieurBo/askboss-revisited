class CreateCard < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
    	t.string :question
    	t.string :answer
    	t.belongs_to :flash_card, index: true
    end
  end
end
