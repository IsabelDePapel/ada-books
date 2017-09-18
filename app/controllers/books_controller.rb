class BooksController < ApplicationController

  BOOKS = [{id: 1, title: 'Object Oriented Design in Ruby', author: 'Sandi Metz', description: 'Book about Ruby', price: 20},
            {id: 2, title: 'Harry Potter and the Goblet of Fire', author: 'J.K. Rowling', description: "One muggle's fight against You-Know-Who", price: 5},
            {id: 3, title: 'The Girl with the Dragon Tattoo', author: 'Stieg Larsson', description: 'Swedish book', price: 7}]

  def index
    @books = BOOKS
  end

  def show
    id = params[:id].to_i
    @book = nil
    BOOKS.each do |book|
      if book[:id] == id
        @book = book
      end
    end
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end
end
