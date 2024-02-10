class CreateScreenings < ActiveRecord::Migration[7.1]
  def change
    create_table :screenings do |t|
      t.date :show_date
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
