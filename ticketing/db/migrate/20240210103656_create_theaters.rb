class CreateTheaters < ActiveRecord::Migration[7.1]
  def change
    create_table :theaters do |t|
      t.string :name
      t.integer :max_audience_count

      t.timestamps
    end
  end
end
