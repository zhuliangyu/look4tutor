json.array! @events, partial: 'events/event' do |event|
  json.extract! event, :id, :title
  json.start event.start_time
  json.end event.end_time
  json.url event_url(event, format: :html)
end


# json.array! @events, partial: 'events/event', as: :event