class CreateAddImageToBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :add_image_to_books do |t|
      t.string :image_id

      t.timestamps
    end
  end
end
