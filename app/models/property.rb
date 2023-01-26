# frozen_string_literal: true

class Property < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_address_and_name,
    against: [ :address, :name ],
    using: {
      tsearch: { prefix: true } 
    }
end
