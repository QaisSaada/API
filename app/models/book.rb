class Book < ApplicationRecord
  validates :title, length: { minimum: 3 }
  validates :author, length: { minimum: 3 }
end
