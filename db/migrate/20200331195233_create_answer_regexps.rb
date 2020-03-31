class CreateAnswerRegexps < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_regexps do |t|
      t.string :regexp

      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
