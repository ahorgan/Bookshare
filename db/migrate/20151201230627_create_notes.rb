class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.string :topic
      t.text :content
      t.integer :parent_note_id

      t.timestamps
    end
  end
end
