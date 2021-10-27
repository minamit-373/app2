class AddImageToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :Image_id, :string
  end
end
