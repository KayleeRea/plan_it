class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_type
      t.string :date
      t.string :time
    end
  end
end
