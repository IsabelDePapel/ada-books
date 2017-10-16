class AddFksToBooksGenres < ActiveRecord::Migration[5.1]
  def change
    # not migrated--this adds ref to column books_id & genres_id
    # add_reference :books_genres, :books, foreign_key: true
    # add_reference :books_genres, :genres, foreign_key: true
  end
end
