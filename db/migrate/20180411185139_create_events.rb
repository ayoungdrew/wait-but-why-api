class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :why
      t.string :title
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
