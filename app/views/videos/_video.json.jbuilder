json.extract! video, :id, :title, :url, :cont_view, :user_id, :created_at, :updated_at
json.url video_url(video, format: :json)
