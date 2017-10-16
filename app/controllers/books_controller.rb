class BooksController < ApplicationController
  include BooksHelper
  # BOOKS = [{id: 1, title: 'Object Oriented Design in Ruby', author: 'Sandi Metz', description: 'Book about Ruby', price: 20},
  #           {id: 2, title: 'Harry Potter and the Goblet of Fire', author: 'J.K. Rowling', description: "One muggle's fight against You-Know-Who", price: 5},
  #           {id: 3, title: 'The Girl with the Dragon Tattoo', author: 'Stieg Larsson', description: 'Swedish book', price: 7}]

  # FLASH NOTICES???
  def index
    # @books = Book.all (unsorted)
    if params[:genre_id]
      genre = Genre.find_by(id: params[:genre_id])
      @books = genre.books
    else
      @books = Book.order(:title)
    end
  end

  def show
    @book = Book.find(params[:id].to_i)

    # id = params[:id].to_i
    # @book = nil
    # BOOKS.each do |book|
    #   if book[:id] == id
    #     @book = book
    #   end
    # end
  end

  def edit
    # find will error if no id; find_by just returns nil
    @book = Book.find_by( id: params[:id].to_i )

    # defensive programming (what if above doesn't work--i.e. can't get book)
    unless @book # checks for nil (if this is nil)
      redirect_to books_path
    end
  end

  def update
    # like create, this page won't render so don't need instance variable
    # can just use local
    @book = Book.find_by( id: params[:id].to_i )
    redirect_to root_path unless @book # if can't find book, redirect to home page

    # book.title = params[:book][:title]
    # book.author = params[:book][:author]

    # if book.save
    # if book.update_attributes title: params[:book][:title], author: params[:book][:author]
    # if book.update_attributes params[:book] # this won't work FOR SECURITY REASONS (could sneak somethign into params otherwise)
    # this does above, but permits changes to only what's specified
    # STRONG PARAMS
    # also works with new / create
    # if book.update_attributes params.require(:book).permit(:title, :author)
    if @book.update_attributes book_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def new
    @book = Book.new
  end

  def create
    # this page won't actually render anything (nothing with view)
    @book = Book.new(title: params[:book][:title], author_id: params[:book][:author_id], price: nil, description: nil)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @book = Book.find_by( id: params[:id] )
    @book.destroy

    redirect_to root_path
  end

  private

  def book_params
    return params.require(:book).permit(:title, :author_id, :description, :price)
  end
end
