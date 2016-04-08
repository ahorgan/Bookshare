class AddCodenameToUser < ActiveRecord::Migration
  def change
    add_column :users, :codename, :string
  end
end
