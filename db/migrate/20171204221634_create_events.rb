class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :event_date
      t.time :start_time
      t.time :end_time

      t.belongs_to :user, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
