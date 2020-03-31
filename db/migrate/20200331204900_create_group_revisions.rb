class CreateGroupRevisions < ActiveRecord::Migration[6.0]
  def change
    create_table :group_revisions do |t|
      t.references :group, foreign_key: true
      t.references :revision, foreign_key: true

      t.timestamps
    end
  end
end
