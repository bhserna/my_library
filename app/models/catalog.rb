module Catalog
  DATA =  [{
    name: "The Outsider",
    author_name: "Stephen King",
    isbn: "12341234",
    published_on: Date.new(2007, 10, 20),
    copies_count: 30
  },

  {
    name: "The President Is Missing",
    author_name: "Bill Clinton",
    isbn: "87623464",
    published_on: Date.new(2015, 10, 20),
    copies_count: 10
  },

  {
    name: "Harry Potter and the Sorcerer's Stone",
    author_name: "J.K. Rowling",
    isbn: "876212344",
    published_on: Date.new(2016, 2, 20),
    copies_count: 10
  },

  {
    name: "Something in the Water",
    author_name: "Catherine Steadman",
    isbn: "876212341234",
    published_on: Date.new(2017, 2, 20),
    copies_count: 30
  },

  {
    name: "Harry Potter and the Goblet of Fire",
    author_name: "J.K. Rowling",
    isbn: "543876212344",
    published_on: Date.new(2015, 2, 20),
    copies_count: 20
  },

  {
    name: "Little Fires Everywhere",
    author_name: "Celeste NG",
    isbn: "5438762109874",
    published_on: Date.new(2016, 2, 20),
    copies_count: 12
  }]

  def self.setup
    DATA.each do |book_data|
      register_book(book_data)
    end
  end

  def self.register_book(attrs)
    Book.create(attrs)
  end

  def self.update_book(id, attrs)
    book = Book.find(id)
    book.update(attrs)
  end

  def self.delete_book(id)
    book = Book.find(id)
    book.destroy
  end

  def self.find_book(id)
    book = Book.find_by(id: id)
    print_book(book)
  end

  def self.find_book_by_isbn(isbn)
    book = Book.find_by(isbn: isbn)
    print_book(book)
  end

  def self.find_all_books
    books = Book.all
    print_books(books)
  end

  def self.find_all_books_by_publication_date
    books = Book.order(published_on: :asc)
    print_books(books)
  end

  def self.find_all_books_by_publication_date_in_descendent_order
    books = Book.order(published_on: :desc)
    print_books(books)
  end

  def self.find_all_by_year(year)
    #books = Book.all.select do |book|
      #book.publication_year == year
    #end

    range = Date.new(year, 1, 1)..Date.new(year, 12, 31)
    books = Book.where(published_on: range)

    print_books(books)
  end

  def self.find_all_by_author(author_name)
    books = Book.where(author_name: author_name)
    print_books(books)
  end

  def self.author_names
    Book.pluck(:author_name).uniq.each do |name|
      puts "- #{name}"
    end
    nil
  end

  def self.isbns
    Book.pluck(:isbn).uniq.map(&:to_i).each do |name|
      puts "- #{name}"
    end
    nil
  end

  def self.author_name_and_books_count
    Book.all.group_by(&:author_name).each do |author_name, books|
      puts "- #{author_name} (#{books.count})"
    end
    nil
  end

  def self.print_books(books)
    books.each do |book|
      print_book_for_list(book)
    end
    nil
  end

  def self.print_book_for_list(book)
    puts "ID: #{book.id} - (#{book.isbn}) #{book.name}, por #{book.author_name} - Año: #{book.publication_year}"
  end

  def self.print_book(book)
    return "Libro no encontrado" unless book

    puts "ID: #{book.id}"
    puts "ISBN: #{book.isbn}"
    puts "Nombre: #{book.name}"
    puts "Autor: #{book.author_name}"
    puts "Año de publicación: #{book.publication_year}"
    puts "Número de copias: #{book.copies_count}"
  end
end

