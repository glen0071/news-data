class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :search_terms
      t.string :query_url
      t.integer :articles_amount
      t.references :query, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
