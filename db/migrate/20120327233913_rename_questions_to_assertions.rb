class RenameQuestionsToAssertions < ActiveRecord::Migration
  def up
    rename_table :q_and_a_machine_questions, :q_and_a_machine_assertions
    rename_column :q_and_a_machine_assertions, :question, :assertion
  end

  def down
    rename_table :q_and_a_machine_assertions, :q_and_a_machine_questions
    rename_column :q_and_a_machine_questions, :assertion, :question
  end
end
