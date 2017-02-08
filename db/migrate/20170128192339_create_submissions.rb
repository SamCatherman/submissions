class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :title
      t.string :author
      t.string :body
      t.timestamps null: false
    end
  end
end
