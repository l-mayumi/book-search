class Book < ApplicationRecord
  validates :title, :description, :author_name, presence: true
end
