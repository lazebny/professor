class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.integer :score

      t.references :revision, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
