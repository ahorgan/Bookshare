class AddPageNumToNote < ActiveRecord::Migration
  def change
    add_column :notes, :page_num, :integer
  end
end
