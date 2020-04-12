class Fixes1 < ActiveRecord::Migration[6.0]
  def change
    remove_column :tests, :name, :string
    add_reference :answers, :test_question, foreign_key: true
  end
end
