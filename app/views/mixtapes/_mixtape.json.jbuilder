json.extract! mixtape,
              :id,
              :user_id,
              :title,
              :subtitle,
              :slug,
              :description,
              :visibility,
              :published_at,
              :created_at,
              :updated_at

json.url mixtape_url(mixtape, format: :json)
