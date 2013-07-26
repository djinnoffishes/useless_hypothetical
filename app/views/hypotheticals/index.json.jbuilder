json.array!(@hypotheticals) do |hypothetical|
  json.extract! hypothetical, 
  json.url hypothetical_url(hypothetical, format: :json)
end
