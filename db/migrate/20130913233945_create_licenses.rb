class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :number
      t.string :state

      t.timestamps
    end
  end
end
