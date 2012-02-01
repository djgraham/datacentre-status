class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.datetime :scheduled_at
      t.datetime :resolved_at
      t.references :status

      t.timestamps
    end
    add_index :events, :status_id
  end
end
