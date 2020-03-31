class CreateRevisionTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :revision_topics do |t|
      t.references :revision, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
