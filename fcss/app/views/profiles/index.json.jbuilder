json.array!(@profiles) do |profile|
  json.extract! profile, :id, :target, :description
  json.url profile_url(profile, format: :json)
end
