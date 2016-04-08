class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.references :book, index: true

      t.timestamps
    end
  end
end
