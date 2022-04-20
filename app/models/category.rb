class Category < ApplicationRecord
  belongs_to :user
  has_many :category_records
  has_many :records, through: :category_records
  has_attached :icon

  validates :name, presence: true, length: { maximum: 250 }

  def recent_categories
    categories.order(created_at: :DESC)
  end

  def recent_records
    records.order(created_at: :DESC)
  end
end
