require 'test_helper'

describe Book do
  let(:book) { Book.new }
  let(:hamlet) { books(:hamlet) }

  it "must have a title to be valid" do
    hamlet.valid?.must_equal true

    hamlet.title = nil
    hamlet.valid?.must_equal false

    book.valid?.must_equal false
    # can also be written as value(book).valid?must_equal false
    # value(book).must_be :valid?
    # book.title = books(:gatsby).title
    # book.author = authors(:fscott)
    # puts book.errors.messages
    # book.save
    #book.valid?.must_equal true
  end

  it "must have an author to be valid" do
    book.title = "The Shining"
    book.valid?.must_equal false

    book.author = Author.new(name: "Stephen King")
    book.valid?.must_equal true, "If given an author the book is valid"
  end

  it "must have a title that is unique" do
    book.author = authors(:fscott)
    book.title = books(:gatsby).title
    book.save.must_equal false  # needs to be saved for this test to pass

    book.errors.keys.must_include :title
    book.errors[:title].must_include "has already been taken"

    new_book = Book.new(author: authors(:austen))
    new_book.title = "The Great Gatsby"
    new_book.valid?.must_equal false, "Book can't have same title as another book"

    new_book.title = books(:pride)
    new_book.valid?.must_equal true

  end

  it "must have an author and title" do
    book.save

    book.errors.keys.must_include :title
    #book.errors[:title].must_equal ["can't be blank"] # default msg for presence]
    book.errors.keys.must_include :author
    #book.errors[:author].must_equal ["must exist"] # default msg for FK

    book.errors.each do |column, msg|

    end
  end
end
