json.array!(@shares) do |share|
  json.extract! share, :id, :from_user_id, :to_user_id, :book_id
  json.url share_url(share, format: :json)
end
