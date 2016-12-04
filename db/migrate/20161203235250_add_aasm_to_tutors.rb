class AddAasmToTutors < ActiveRecord::Migration
  def change
    add_column :tutors, :aasm_state, :string, default: :draft
  end
end
