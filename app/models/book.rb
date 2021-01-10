class Book < ApplicationRecord
  validates :title, :description, :author_name, presence: true

  def self.find_text(term)
    where('title LIKE ? OR description LIKE ?', "%#{term}%", "%#{term}%")
  end

  def self.find_author(name)
    where('author_name LIKE ?', "%#{name}%")
  end
end
