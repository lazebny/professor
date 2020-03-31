class CreateAnswerExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_examples do |t|
      t.string :body

      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
