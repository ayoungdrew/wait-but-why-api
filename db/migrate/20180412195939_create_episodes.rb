class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.date :date, null: false
      t.string :why, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
