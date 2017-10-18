require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  let(:book_params) { { title: "A Title", author_id: authors(:shakes).id } }

  describe "Authenticated Users" do
    it "allows authenticated users to edit a book" do
      user = users(:kari)
      log_in(user, :github)

      get edit_book_path(Book.first.id)

      must_respond_with :success
    end
  end

  describe "guest users" do
    it "does not allow guest users to edit a book" do
      get edit_book_path(Book.first.id)

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end

  it "should get index" do
    get books_path
    must_respond_with :success
  end

  it "should get a book show page" do
    get book_path(books(:hamlet).id)
    must_respond_with :success
  end

  describe "create book" do
    it "should be able to create a book" do
      post books_path, params: { book: { title: "A Title", author_id: authors(:shakes).id } }

      must_respond_with :redirect
      must_redirect_to root_path
    end

    it "should increase book count" do
      # post books_path, params: { book: { title: "A Title", author_id: authors(:shakes).id } }

      proc { post books_path, params: { book: book_params } }.must_change 'Book.count', 1
    end
  end

  describe "update book" do
    it "should be able to successfully update a book title" do
      new_title = "Updated Title"
      patch book_path( books(:hamlet) ), params: { book: { title: new_title } }

      updated_book = Book.find(books(:hamlet).id)
      updated_book.title.must_equal new_title

      must_respond_with :redirect
      must_redirect_to root_path
    end
  end




  # test "should get index" do
  #   get books_index_url
  #   assert_response :success
  # end
  #
  # test "should get show" do
  #   get books_show_url
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get books_edit_url
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get books_update_url
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get books_new_url
  #   assert_response :success
  # end
  #
  # test "should get create" do
  #   get books_create_url
  #   assert_response :success
  # end
  #
  # test "should get destroy" do
  #   get books_destroy_url
  #   assert_response :success
  # end

end
