json.array!(@classifybooks) do |classifybook|
  json.extract! classifybook, :id, :condition, :user_id
  json.url classifybook_url(classifybook, format: :json)
end
