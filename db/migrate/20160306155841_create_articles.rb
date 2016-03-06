class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url
      t.string :source
      t.text :snippet
      t.text :headline
      t.references :response, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
