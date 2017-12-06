class AddLocationToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :location, :string
  end
end
