class AddResolvedFlagToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :resolved, :boolean
  end
end
