class Product < ApplicationRecord
  has_many :images
  scope :available, -> { where(available: true) }
  scope :released, ->(start_date, end_date) do
    start_date && end_date ? where(released: start_date..end_date) : all
  end
end
