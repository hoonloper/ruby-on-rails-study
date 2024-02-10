class CreateScreenings < ActiveRecord::Migration[7.1]
  def change
    create_table :screenings do |t|
      t.date :show_date
      t.date :start_time
      t.date :end_time
      t.references :movie, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
