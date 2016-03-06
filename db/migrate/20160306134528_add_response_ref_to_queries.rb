class AddResponseRefToQueries < ActiveRecord::Migration
  def change
    add_reference :queries, :response, index: true, foreign_key: true
  end
end
