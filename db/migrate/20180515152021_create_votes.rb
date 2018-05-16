class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.boolean :vote, default: nil
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
    end
  end
end
