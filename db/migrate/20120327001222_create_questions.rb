class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :q_and_a_machine_questions do |t|
      t.text :question
      t.integer :user_id

      t.timestamps
    end
  end
end
