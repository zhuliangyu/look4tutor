class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :is_tutor, default: false
      t.boolean :is_admin, default: false

      t.timestamps null: false
    end
  end
end
