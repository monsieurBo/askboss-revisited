class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.string :answer
      t.boolean :correct, default: false
      t.references :problem, foreign_key: true

      t.timestamps
    end
  end
end
