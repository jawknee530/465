json.array!(@rejects) do |reject|
  json.extract! reject, :id, :user_id, :profile_id, :profile_id, :user_id
  json.url reject_url(reject, format: :json)
end
