class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      t.string :degree
      t.integer :low_price
      t.integer :high_price
      t.string :cellphone
      t.belongs_to :user, index: true, foreign_key: true, unique: true

      t.timestamps null: false
    end
  end
end
