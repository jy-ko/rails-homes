# frozen_string_literal: true

json.extract! property, :id, :name, :user_id, :address, :latitude, :longitude, :price, :currency, :surface_area, :bed,
              :bath, :floor, :created_at, :updated_at
json.url property_url(property, format: :json)
