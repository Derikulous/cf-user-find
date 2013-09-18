class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :last_searched_for_at
      t.integer :search_count
      t.timestamps
    end
  end
end
