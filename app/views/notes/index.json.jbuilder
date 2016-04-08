json.array!(@notes) do |note|
  json.extract! note, :id, :user_id, :book_id, :topic, :content, :parent_note_id
  json.url note_url(note, format: :json)
end
