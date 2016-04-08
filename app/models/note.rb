class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  belongs_to :parent_note, class_name: "Note"
  has_many :child_notes,
  				foreign_key: :parent_note_id,
  				class_name: "Note"
end
