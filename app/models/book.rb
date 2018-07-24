class Book < ApplicationRecord
  def publication_year
    published_on.year
  end
end
