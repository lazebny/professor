class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body

      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
