ㅎㅎclass CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
