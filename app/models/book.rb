class Book < ApplicationRecord
  # belongs_to automatically includes validation that requires author
  # to change default, just add ", required: false"
  belongs_to :author
  has_and_belongs_to_many :genres
  validates :title, presence: true, uniqueness: true
end
