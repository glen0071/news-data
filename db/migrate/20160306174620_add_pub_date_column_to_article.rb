class AddPubDateColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :pub_date, :date
  end
end
