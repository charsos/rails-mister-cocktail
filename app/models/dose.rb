class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  # There is a :scope option that you can use to specify one or more
  # attributes that are used to limit the uniqueness check:
  validates :ingredient, uniqueness: { scope: :cocktail }
end
