class Book < ApplicationRecord
  validates_presence_of :name

  def publication_year
    published_on.year
  end
end
