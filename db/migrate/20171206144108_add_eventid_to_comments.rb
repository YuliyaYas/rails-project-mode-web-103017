class AddEventidToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :event_id, :integer
  end
end
