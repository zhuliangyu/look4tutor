class AddDescriptionToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :description, :string
  end
end
