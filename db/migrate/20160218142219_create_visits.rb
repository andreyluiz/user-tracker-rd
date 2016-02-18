class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :contact_id
      t.string :page
      t.datetime :when

      t.timestamps null: false
    end
  end
end
