class AddImageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :string, :default => "https://res.cloudinary.com/duqjlnkij/image/upload/v1525218686/doge.jpg"
  end
end
