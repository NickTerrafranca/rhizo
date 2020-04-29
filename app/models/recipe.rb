class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_line_items, dependent: :delete_all
  has_many :quantities, through: :recipe_line_items
  has_many :ingredients, through: :recipe_line_items
  has_many :batches, dependent: :destroy

  accepts_nested_attributes_for :recipe_line_items, reject_if: :all_blank, allow_destroy: true

  before_validation :strip_whitespace
  validates :title, :description, presence: true

  private
    def strip_whitespace
      [title, description].each { |attr| attr.strip! unless attr.nil? }
    end
end
