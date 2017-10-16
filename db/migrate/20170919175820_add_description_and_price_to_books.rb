class AddDescriptionAndPriceToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column(:books, :description, :string)
    add_column(:books, :price, :decimal)
  end
end
