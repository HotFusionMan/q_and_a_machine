class AddReVerbColumnsToAssertions < ActiveRecord::Migration
  def change
    add_column :q_and_a_machine_assertions, :arg1, :string
    add_column :q_and_a_machine_assertions, :relationship, :string
    add_column :q_and_a_machine_assertions, :arg2, :string

    add_column :q_and_a_machine_assertions, :arg1_normalized, :string
    add_column :q_and_a_machine_assertions, :relationship_normalized, :string
    add_column :q_and_a_machine_assertions, :arg2_normalized, :string

    add_column :q_and_a_machine_assertions, :confidence, :float
    add_column :q_and_a_machine_assertions, :arg2_answer_type, :integer
  end
end
