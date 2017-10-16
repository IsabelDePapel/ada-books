class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      # auto adds num for id
      t.timestamps # date row created and date updated
    end
  end
end
