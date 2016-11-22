class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rate
      t.string :body

      t.timestamps null: false
    end
  end
end
