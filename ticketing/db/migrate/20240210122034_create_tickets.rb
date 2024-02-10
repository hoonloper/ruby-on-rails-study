class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :username
      t.references :screening, null: false, foreign_key: true

      t.timestamps
    end

    # username에 대한 unique 인덱스 추가
    add_index :tickets, :username, unique: true
  end
end
