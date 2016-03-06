class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :search_terms
      t.date :begin_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
