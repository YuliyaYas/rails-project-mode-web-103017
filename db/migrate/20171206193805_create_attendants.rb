class CreateAttendants < ActiveRecord::Migration[5.1]
  def change
    create_table :attendants do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :user, foreign_key: true
      
      t.timestamps
    end
  end
end
