class CreateRejects < ActiveRecord::Migration
  def change
    create_table :rejects do |t|
      t.integer :user_id
      t.integer :profile_id
      t.references :profile, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
