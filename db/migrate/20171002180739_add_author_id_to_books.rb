class AddAuthorIdToBooks < ActiveRecord::Migration[5.1]
  def change
    # way to est relationship at db level
    # first tbl is table to which we want to add the ref
    # then the ref we want to add--here add ref to books for each author
    add_reference :books, :author, foreign_key: true
  end
end
