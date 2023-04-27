class Event < ApplicationRecord
    scope :on_date, ->(date) { where("DATE(start_time) = ?", date) }
  end
  
