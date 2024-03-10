class CreateNumbers < ActiveRecord::Migration[7.1]
  def change
    create_table :numbers do |t|
      t.float :float_num
      t.integer :integer_num

      t.timestamps
    end
  end
end
