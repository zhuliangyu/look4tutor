class AddRegionToTutors < ActiveRecord::Migration
  def change
    add_reference :tutors, :region, index: true, foreign_key: true
  end
end
