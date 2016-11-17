require 'rails_helper'

RSpec.describe "tutors/new", type: :view do
  before(:each) do
    assign(:tutor, Tutor.new(
      :degree => "MyString",
      :low_price => 1,
      :high_price => 1,
      :cellphone => "MyString",
      :user => nil
    ))
  end

  it "renders new tutor form" do
    render

    assert_select "form[action=?][method=?]", tutors_path, "post" do

      assert_select "input#tutor_degree[name=?]", "tutor[degree]"

      assert_select "input#tutor_low_price[name=?]", "tutor[low_price]"

      assert_select "input#tutor_high_price[name=?]", "tutor[high_price]"

      assert_select "input#tutor_cellphone[name=?]", "tutor[cellphone]"

      assert_select "input#tutor_user_id[name=?]", "tutor[user_id]"
    end
  end
end
