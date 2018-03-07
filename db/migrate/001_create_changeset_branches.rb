class CreateChangesetBranches < ActiveRecord::Migration
  def change
    create_table :changesets_branches do |t|
      t.integer :changeset_id, null: false
      t.string  :branch,       null: false, limit: 255
    end

    add_index :changesets_branches, :changeset_id
    add_index :changesets_branches, [:changeset_id, :branch], unique: true
  end
end
