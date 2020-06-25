class Batch < ApplicationRecord
  belongs_to :recipe
  has_many :recipe_line_items
  has_many :recipe_line_items, through: :recipe
  validates_associated :recipe
  validates :name, :prep_date, presence: true

  def date_mm_dd_yyyy
    prep_date.strftime("%m/%d/%Y") if prep_date?
  end

  def date_short
    prep_date.strftime("%b %d, '%y") if prep_date?
  end

  def date_long
    prep_date.strftime("%B %e, %Y") if prep_date?
  end

  def display_name(truncate_by: 25)
    [date_mm_dd_yyyy, name.truncate(truncate_by)].reject(&:blank?).join(' - ')
  end

  def concentration_percent
    concentration / 100.00
  end

end
