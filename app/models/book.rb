class Book < ApplicationRecord
  belongs_to :author
  validates_presence_of :name
  default_scope { includes(:author) }

  def publication_year
    published_on.year
  end

  def author_name
    author&.name
  end
end
